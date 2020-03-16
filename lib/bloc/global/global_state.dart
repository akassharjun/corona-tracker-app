part of 'global_bloc.dart';

@immutable
abstract class GlobalEvent extends Equatable {
  GlobalEvent([List props = const []]) : super();
}

class FetchGlobalData extends GlobalEvent {
  @override
  List<Object> get props => null;
}