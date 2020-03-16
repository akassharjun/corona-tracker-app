import 'package:coronatracker/model/global_data.dart';
import 'package:dio/dio.dart';

abstract class Api {
  Future<GlobalData> getGlobalData();
}

class NetworkService extends Api {
  @override
  Future<GlobalData> getGlobalData() async {
    final String _endpoint =
        "https://corona.lmao.ninja/all";
    final Dio _dio = Dio();

    Response response = await _dio.get(_endpoint);

    print(await _dio.get(_endpoint));
    print(_dio.get(_endpoint));
    print("Not working");
    print(response);

    return GlobalData.fromMap(response.data);
  }
}
