
part of 'country_bloc.dart';

@immutable
abstract class CountryState extends Equatable {
  CountryState([List props = const []]) : super();
}

class InitialCountryState extends CountryState {
  @override
  String toString() => 'InitialCountryState';

  @override
  List<Object> get props => null;

}

class NetworkBusyCountryState extends CountryState {
  @override
  String toString() => 'NetworkBusyCountryState';

  @override
  List<Object> get props => null;
}

class NetworkErrorCountryState extends CountryState {
  final String error;

  NetworkErrorCountryState({this.error});

  @override
  String toString() => 'NetworkErrorCountryState';

  @override
  List<Object> get props => null;
}

class DataFetchedCountryState extends CountryState {
  final List<CountryData> countryData;

  DataFetchedCountryState({this.countryData}) : super();

  bool get hasData => countryData.length > 0;

  @override
  String toString() => 'DataFetchedCountryState';

  @override
  List<Object> get props => null;
}