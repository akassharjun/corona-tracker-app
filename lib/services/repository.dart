import 'package:coronatracker/model/global_data.dart';
import 'network.dart';

class GlobalRepository {
  NetworkService networkService = new NetworkService();

  Future<GlobalData> fetchGlobalData() => networkService.getGlobalData();
}
