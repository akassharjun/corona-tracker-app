import 'package:coronatracker/bloc/country/country_bloc.dart';
import 'package:coronatracker/model/country_data.dart';
import 'package:coronatracker/ui/widgets/slide_fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  final CountryBloc _bloc = CountryBloc();

  @override
  void initState() {
    _bloc.add(FetchCountryData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          titleSpacing: 0,
          backgroundColor: Colors.deepPurple,
          elevation: 1.0,
          title: Container(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text('Coronavirus Tracker'),
              ],
            ),
          ),
          centerTitle: true,

          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: <Widget>[
                SizedBox(height: 90.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 16.0),
                  child: Container(
                    height: 36.0,
                    width: double.infinity,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Color(0xffF0F1F5),
                        filled: true,
                        prefix: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                          child: Icon(
                            Icons.search,
                            color: Color(0xffC4C6CC),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                BlocBuilder(
                  bloc: _bloc,
                  builder: (BuildContext context, CountryState state) {
                    if (state is InitialCountryState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is NetworkBusyCountryState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is NetworkErrorCountryState) {
                      return Center(
                        child: Text("There was an error fetching the data"),
                      );
                    }

                    if (state is DataFetchedCountryState) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return CountryInfoCard(
                              countryData: state.countryData[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              color: Colors.transparent,
                              height: 25,
                            );
                          },
                          itemCount: state.countryData.length,
                        ),
                      );
                    }

                    print(state);

                    return Container(child: Text("Not that"));
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
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
                      borderRadius: BorderRadius.circular(10.0)),
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
  static ScreenScaler _scaler;

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
    _scaler = ScreenScaler()..init(context);

    return Expanded(
      child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 8, 2),
                child: SlideFadeTransition(
                  delayStart: Duration(milliseconds: 50),
                  child: Text(
                    count.toString().replaceAllMapped(reg, mathFunc),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: _scaler.getTextSize(15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 2, 8, 8),
                child: SlideFadeTransition(
                  delayStart: Duration(milliseconds: 100),
                  child: Text(
                    tagline.toUpperCase(),
                    style: TextStyle(
                      fontSize: _scaler.getTextSize(9),
                      letterSpacing: 4.0,
                      color: color,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
