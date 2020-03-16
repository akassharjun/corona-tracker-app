import 'package:coronatracker/pages/global.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(32.0),
            height: 300,
            width: double.infinity,
            color: Colors.deepPurple,
            alignment: Alignment.bottomLeft,
            child: Text(
              "Coronavirus\nTracker",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                height: 1
              ),
            ),
          ),
          Expanded(
            child: PageView(
              children: <Widget>[GlobalPage()],
            ),
          )
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
