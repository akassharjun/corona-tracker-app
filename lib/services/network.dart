import 'package:coronatracker/model/global_data.dart';
import 'package:dio/dio.dart';

abstract class Api {
  Future<GlobalData> getGlobalData();
}

class NetworkService extends Api {
  @override
  Future<GlobalData> getGlobalData() async {
//    final String _endpoint =
//        "https://coronavirus-19-api.herokuapp.com/all";
//    final Dio _dio = Dio();
//
//    Response response = await _dio.get(_endpoint);

//    return GlobalData.fromMap(response.data);

    return GlobalData(cases: 223342, deaths: 5432, recovered: 122432);
  }
}
