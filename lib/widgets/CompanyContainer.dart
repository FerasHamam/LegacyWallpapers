import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:legacywallpapers/widgets/AnimatedText.dart';
//providers
import '../providers/companies.dart';
import 'package:provider/provider.dart';
//widgets
import 'CompanyCard.dart';
//functions

// ignore: camel_case_types
class CompanyContainer extends StatefulWidget {
  @override
  _CompanyContainerState createState() => _CompanyContainerState();
}

class _CompanyContainerState extends State<CompanyContainer>
    with TickerProviderStateMixin {
  List<Color> pickedColors = [
    Color.fromRGBO(20, 40, 160, 1),
    Colors.indigoAccent
  ];
  late AnimationController _animController;

  @override
  void initState() {
    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: pickedColors,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Consumer<Companies>(
          builder: (ctx, companies, child) {
            return PageView.builder(
                dragStartBehavior: DragStartBehavior.down,
                onPageChanged: (index) {
                  setState(() {
                    pickedColors = [
                      companies.companies[index].companyColor,
                      Colors.cyan,
                    ];
                    _animController.forward();
                  });
                },
                scrollDirection: Axis.horizontal,
                itemCount: companies.companies.length,
                itemBuilder: (ctx, index) {
                  final item = companies.companies[index];
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).viewPadding.top * 1.2,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'L E G A C Y',
                            style: TextStyle(fontSize: 25),
                          )),
                      Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.1,
                      ),
                      AnimatedText(item.companyName, true),
                      CompanyCard(
                        item.companyName,
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
