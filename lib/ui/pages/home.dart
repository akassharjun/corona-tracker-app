
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'countries.dart';
import 'global.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          GlobalPage(),
          CountriesPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.globe),
            title: Text('Global'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.flag),
            title: Text('Country'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.info),
            title: Text('About'),
          )
        ],
        onTap: (int index) {
          _controller.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInToLinear,
          );
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}
