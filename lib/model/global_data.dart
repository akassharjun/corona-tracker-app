// To parse this JSON data, do
//
//     final globalData = globalDataFromJson(jsonString);

import 'dart:convert';

GlobalData globalDataFromJson(String str) => GlobalData.fromMap(json.decode(str));

String globalDataToJson(GlobalData data) => json.encode(data.toMap());

class GlobalData {
  int cases;
  int deaths;
  int recovered;

  GlobalData({
    this.cases,
    this.deaths,
    this.recovered,
  });

  factory GlobalData.fromMap(Map<String, dynamic> json) => GlobalData(
    cases: json["cases"],
    deaths: json["deaths"],
    recovered: json["recovered"],
  );

  Map<String, dynamic> toMap() => {
    "cases": cases,
    "deaths": deaths,
    "recovered": recovered,
  };
}
