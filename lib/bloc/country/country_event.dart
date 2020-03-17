part of 'country_bloc.dart';

@immutable
abstract class CountryEvent extends Equatable {
  CountryEvent([List props = const []]) : super();
}

class FetchCountryData extends CountryEvent {
  @override
  List<Object> get props => null;
}
