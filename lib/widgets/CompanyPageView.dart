import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//providers
import '../providers/companies.dart';
//widgets
import 'CompanyCard.dart';
import 'CompanyName.dart';

class CompanyPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //initial values
    Size deviceSize = MediaQuery.of(context).size;
    final PageController _controller = PageController();
    final companies = Provider.of<Companies>(context, listen: false).companies;
    //

    //function to build cards
    List<Widget> companyCardWidget() {
      print('object');
      return companies
          .map(
            (company) => CompanyCard(company.companyName),
          )
          .toList();
    }
    //

    return Column(
      children: [
        SizedBox(
          height: deviceSize.height * 0.15,
        ),
        Consumer<Companies>(
          builder: (ctx, companies, _) {
            return Container(
                child: AnimatedText(
                    companies.companies[companies.currentIndex].companyName));
          },
        ),
        Flexible(
          child: PageView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            children: companyCardWidget(),
            physics: BouncingScrollPhysics(),
            onPageChanged: (index) {
              Provider.of<Companies>(context, listen: false).setIndex(index);
            },
          ),
        ),
      ],
    );
  }
}
