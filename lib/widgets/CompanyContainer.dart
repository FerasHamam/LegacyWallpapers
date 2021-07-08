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
      duration: Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: pickedColors,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('L E G A C Y'),
          backgroundColor: Colors.transparent,
          actions: [],
        ),
        backgroundColor: Colors.transparent,
        body: Consumer<Companies>(
          builder: (ctx, companies, child) {
            return PageView.builder(
                dragStartBehavior: DragStartBehavior.down,
                onPageChanged: (index) {
                  setState(() {
                    pickedColors = [
                      companies.companies[index].companyColor,
                      Colors.indigo,
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
