import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<LogoutEvent>(_logoutEvent);
  }

  _logoutEvent(LogoutEvent event, emit) async {
    emit(state.copyWith(signOutState: Status.loading));
    await Future.delayed(const Duration(seconds: 1));
    try {
      await FirebaseAuth.instance.signOut();
      emit(state.copyWith(
        signOutState: Status.success,
      ));
    } on FirebaseException catch (e) {
      emit(state.copyWith(
        signOutState: Status.error,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        signOutState: Status.error,
        errorMessage: e.toString(),
      ));
    }
    if (state.signOutState.isError) {
      emit(state.copyWith(signOutState: Status.initial));
    }
  }
}