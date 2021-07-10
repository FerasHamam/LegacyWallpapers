import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//itmes
import '../items/company.dart';
//providers
import '../providers/companies.dart';
//widgets
import 'CompanyCard.dart';

class CompanyPageView extends StatelessWidget {
  //function to build cards
  List<Widget> companyCardWidget(List<Company> companies) {
    print('object');
    return companies
        .map(
          (company) => CompanyCard(company.companyName),
        )
        .toList();
  }
  //

  @override
  Widget build(BuildContext context) {
    //initial values
    final PageController _controller = PageController();
    final companies = Provider.of<Companies>(context, listen: false).companies;
    //

    return PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      children: companyCardWidget(companies),
      physics: BouncingScrollPhysics(),
      onPageChanged: (index) {
        Provider.of<Companies>(context, listen: false).setIndex(index);
      },
    );
  }
}
