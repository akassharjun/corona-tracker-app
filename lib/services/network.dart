import 'dart:convert';

import 'package:coronatracker/model/country_data.dart';
import 'package:coronatracker/model/global_data.dart';
import 'package:dio/dio.dart';

abstract class Api {
  Future<GlobalData> getGlobalData();

  Future<List<CountryData>> getCountryData();
}

class NetworkService extends Api {
  static const String BASE_ENDPOINT =
      'https://coronavirus-19-api.herokuapp.com';

  @override
  Future<GlobalData> getGlobalData() async {
    final String _endpoint = "$BASE_ENDPOINT/all";

    final Dio _dio = Dio();

    Response response = await _dio.get(_endpoint);

    return GlobalData.fromMap(response.data);

    return GlobalData(cases: 223342, deaths: 5432, recovered: 122432);
  }

  @override
  Future<List<CountryData>> getCountryData() async {
    final String _endpoint = "$BASE_ENDPOINT/countries";

    final Dio _dio = Dio();

    Response response = await _dio.get(_endpoint);

    Iterable l = response.data;

    List<CountryData> list =
        l.map((dynamic model) => CountryData.fromMap(model)).toList();

    return list;

    return [
      CountryData(
        cases: 32432,
        deaths: 5400,
        todayCases: 32,
        todayDeaths: 13,
        recovered: 14351,
        critical: 6000,
        country: "Sri Lanka",
      ),
      CountryData(
        cases: 32432,
        deaths: 5400,
        todayCases: 32,
        todayDeaths: 13,
        recovered: 14351,
        critical: 6000,
        country: "China",
      ),
      CountryData(
        cases: 32432,
        deaths: 5400,
        todayCases: 32,
        todayDeaths: 13,
        recovered: 14351,
        critical: 6000,
        country: "India",
      )
    ];
  }
}
