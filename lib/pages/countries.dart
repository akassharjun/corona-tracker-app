import 'package:coronatracker/model/country_data.dart';
import 'package:coronatracker/pages/global.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CountriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(32.0),
          width: double.infinity,
          color: Colors.deepPurple,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Text(
                  "Coronavirus Tracker",
                  style:
                      TextStyle(fontSize: 25, color: Colors.white, height: 1),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 25,
                ),
                TextField(
                  style: TextStyle(color: Colors.black45),
                  decoration: InputDecoration(
                    suffix: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 2, 10, 0),
                      child: Opacity(
                        child: FaIcon(FontAwesomeIcons.search),
                        opacity: 0.4,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0),
                      ),
                      gapPadding: 0,
                    ),
                    hintText: "Enter a country name",
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: <Widget>[
              Divider(
                color: Colors.transparent,
                height: 25,
              ),
              CountryInfoCard(
                countryData: CountryData(
                  cases: 32432,
                  deaths: 5400,
                  todayCases: 32,
                  todayDeaths: 13,
                  recovered: 14351,
                  critical: 6000,
                  country: "Sri Lanka",
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class CountryInfoCard extends StatelessWidget {
  final CountryData countryData;

  static Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffAC79FF), Color(0xff863CFF)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  const CountryInfoCard({
    Key key,
    @required this.countryData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.2,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFFDDA7FF),
                      Color(0xFFAC79FF),
                    ]),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      countryData.country.toUpperCase(),
                      style: TextStyle(
                        foreground: Paint()..shader = linearGradient,
                        fontSize: 20,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    countryData.country.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()..shader = linearGradient,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InformationBox(
                    count: countryData.cases,
                    tagline: "cases",
                    color: Colors.black45,
                  ),
                  InformationBox(
                    count: countryData.deaths,
                    tagline: "deaths",
                    color: Colors.red,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InformationBox(
                    count: countryData.recovered,
                    tagline: "recovered",
                    color: Colors.green,
                  ),
                  InformationBox(
                    count: countryData.critical,
                    tagline: "critical",
                    color: Colors.deepOrange,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InformationBox(
                    count: countryData.todayCases,
                    tagline: "cases today",
                    color: Colors.amber,
                  ),
                  InformationBox(
                    count: countryData.todayDeaths,
                    tagline: "deaths today",
                    color: Colors.red,
                  ),
                ],
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20.0,
            spreadRadius: 0.1,
            offset: Offset(
              0.0,
              10.0,
            ),
          )
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }
}

class InformationBox extends StatelessWidget {
  final int count;
  final String tagline;
  final Color color;

  static RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  static Function mathFunc = (Match match) => '${match[1]},';

  const InformationBox({
    Key key,
    this.count,
    this.tagline,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 8, 2),
                child: Text(
                  count.toString().replaceAllMapped(reg, mathFunc),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 2, 8, 8),
                child: Text(
                  tagline.toUpperCase(),
                  style: TextStyle(
                    letterSpacing: 4.0,
                    color: color,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
