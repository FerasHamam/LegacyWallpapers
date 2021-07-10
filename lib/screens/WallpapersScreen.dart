import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//provider
import '../providers/companies.dart';

class WallpapersScreen extends StatefulWidget {
  static String name = 'WallpapersScreen';
  @override
  _WallpapersScreenState createState() => _WallpapersScreenState();
}

class _WallpapersScreenState extends State<WallpapersScreen> {
  @override
  Widget build(BuildContext context) {
    final _index = Provider.of<Companies>(context, listen: false).currentIndex;
    final String _currentCompanyName =
        Provider.of<Companies>(context, listen: false)
            .companies[_index]
            .companyName;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(_currentCompanyName),
            centerTitle: true,
            flexibleSpace: Hero(
              tag: 'CompanyImage',
              child: Image.asset(
                'lib/assets/images/$_currentCompanyName.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
