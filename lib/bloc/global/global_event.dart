part of 'global_bloc.dart';

@immutable
abstract class GlobalState extends Equatable {
  GlobalState([List props = const []]) : super();
}

class InitialGlobalState extends GlobalState {
  @override
  String toString() => 'InitialGlobalState';

  @override
  List<Object> get props => null;

}

class NetworkBusyGlobalState extends GlobalState {
  @override
  String toString() => 'NetworkBusyGlobalState';

  @override
  List<Object> get props => null;
}

class NetworkErrorGlobalState extends GlobalState {
  final String error;

  NetworkErrorGlobalState({this.error});

  @override
  String toString() => 'NetworkErrorGlobalState';

  @override
  List<Object> get props => null;
}

class DataFetchedGlobalState extends GlobalState {
  final GlobalData globalData;

  DataFetchedGlobalState({this.globalData}) : super();

  bool get hasData => globalData != null;

  @override
  String toString() => 'NewsFetchedGlobalState';

  @override
  List<Object> get props => null;
}