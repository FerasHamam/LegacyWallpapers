import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//providers
import '../providers/companies.dart';
//widgets
import '../widgets/CompanyPageView.dart';
import '../widgets/CompanyName.dart';

class CompanyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<Companies>(
        builder: (ctx, companies, ch) => Container(
          height: deviceSize.height,
          color: Colors.amber,
          child: ch,
        ),
        child: Column(
          children: [
            SizedBox(
              height: deviceSize.height * 0.15,
            ),
            Consumer<Companies>(
              builder: (ctx, companies, _) {
                return Container(
                    child: AnimatedText(companies
                        .companies[companies.currentIndex].companyName));
              },
            ),
            Flexible(child: CompanyPageView()),
          ],
        ),
      ),
    );
  }
}
