import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//providers
import '../providers/companies.dart';
//widgets
import 'CompanyCard.dart';

class CompanyPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController();
    final companies = Provider.of<Companies>(context).companies;
    List<Widget> companyCardWidget() {
      return companies
          .map(
            (company) => CompanyCard(company.companyName),
          )
          .toList();
    }

    return PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      children: companyCardWidget(),
      physics: BouncingScrollPhysics(),
      onPageChanged: (index) {
        Provider.of<Companies>(context, listen: false).setIndex(index);
      },
    );
  }
}
