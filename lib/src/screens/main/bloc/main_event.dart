part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class LogoutEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}