import 'package:coronatracker/pages/countries.dart';
import 'package:coronatracker/pages/global.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
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
      ),
    );
  }
}
