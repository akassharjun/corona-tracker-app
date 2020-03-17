import 'package:coronatracker/model/country_data.dart';
import 'package:coronatracker/model/global_data.dart';
import 'network.dart';

class GlobalRepository {
  NetworkService networkService = new NetworkService();

  Future<GlobalData> fetchGlobalData() => networkService.getGlobalData();
}

class CountryRepository {
  NetworkService networkService = new NetworkService();

  Future<List<CountryData>> fetchCountryData() => networkService.getCountryData();
}
