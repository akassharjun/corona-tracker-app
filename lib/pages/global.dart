import 'package:coronatracker/bloc/global/global_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GlobalPage extends StatefulWidget {
  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  final GlobalBloc _globalBloc = GlobalBloc();
  var parser = EmojiParser();

  @override
  void initState() {
    _globalBloc.add(FetchGlobalData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder(
            bloc: _globalBloc,
            builder: (BuildContext context, GlobalState state) {
              if (state is InitialGlobalState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is NetworkBusyGlobalState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is NetworkErrorGlobalState) {
                return Center(
                  child: Text("There was an error fetching the data"),
                );
              }

              if (state is DataFetchedGlobalState) {
                return Column(
                  children: <Widget>[
                    Spacer(),
                    InformationCard(
                      count: state.globalData.cases,
                      tagline: "global corona cases",
                      color: Colors.deepPurple,
                    ),
                    Spacer(),
                    InformationCard(
                      count: state.globalData.deaths,
                      tagline: "global deaths",
                      color: Colors.redAccent,
                    ),
                    Spacer(),
                    InformationCard(
                      count: state.globalData.recovered,
                      tagline: "global recovery",
                      color: Colors.green,
                    ),
                    Spacer(),
//                    Text(parser.getEmoji("🇨🇳").toString()),
                  ],
                );
              }

              return Container();
            },
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _globalBloc.close();
  }
}

class Spacer extends StatelessWidget {
  const Spacer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.transparent,
      height: 25,
    );
  }
}

class InformationCard extends StatelessWidget {
  final int count;
  final String tagline;
  final Color color;

  const InformationCard({
    this.count,
    this.tagline,
    this.color,
  });

  static RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  static Function mathFunc = (Match match) => '${match[1]},';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 8, 2),
            child: Text(
              count.toString().replaceAllMapped(reg, mathFunc),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
            child: Text(
              "${tagline.toUpperCase()}",
              style: TextStyle(
                letterSpacing: 4.0,
                color: color,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20.0,
            // has the effect of softening the shadow
            spreadRadius: 0.1,
            // has the effect of extending the shadow
            offset: Offset(
              0.0, // horizontal, move right 10
              10.0, // vertical, move down 10
            ),
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
    );
  }
}
