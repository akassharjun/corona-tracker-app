import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coronatracker/model/country_data.dart';
import 'package:coronatracker/services/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'country_event.dart';

part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository _repository = CountryRepository();

  @override
  CountryState get initialState => InitialCountryState();

  @override
  Stream<CountryState> mapEventToState(CountryEvent event) async* {
    if (event is FetchCountryData) {
      yield* _mapFetchCountryDataToState();
    }
  }

  Stream<CountryState> _mapFetchCountryDataToState() async* {
    yield NetworkBusyCountryState();
    try {
      // network call
      List<CountryData> data = await _repository.fetchCountryData();

      yield DataFetchedCountryState(countryData: data);
    } catch (error, stacktrace) {
      // handle network call error
      print(stacktrace);
      yield NetworkErrorCountryState(error: error.toString());
    }
  }
}
