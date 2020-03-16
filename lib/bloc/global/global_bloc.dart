import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coronatracker/model/global_data.dart';
import 'package:coronatracker/services/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'global_event.dart';

part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final GlobalRepository _repository = GlobalRepository();

  @override
  GlobalState get initialState => InitialGlobalState();

  @override
  Stream<GlobalState> mapEventToState(GlobalEvent event) async* {
    if (event is FetchGlobalData) {
      yield* _mapFetchGlobalDataToState();
    }
  }

  Stream<GlobalState> _mapFetchGlobalDataToState() async* {
    yield NetworkBusyGlobalState();
    try {
      // network call
      GlobalData data = await _repository.fetchGlobalData();

      yield DataFetchedGlobalState(globalData: data);
    } catch (error, stacktrace) {
      // handle network call error
      print(stacktrace);
      yield NetworkErrorGlobalState(error: error.toString());
    }
  }
}
