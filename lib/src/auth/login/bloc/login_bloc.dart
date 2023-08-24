import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginBottomEvent>(_login);
  }

  Future<void> _login(LoginBottomEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(firebaseStatus: Status.loading));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(state.copyWith(
        firebaseStatus: Status.success,
      ));
    } on FirebaseException catch (e) {
      emit(state.copyWith(
        firebaseStatus: Status.error,
        errorMessage: e.message,
      ));
      emit(state.copyWith(firebaseStatus: Status.initial));
    } catch (e) {
      emit(state.copyWith(firebaseStatus: Status.error, errorMessage: e.toString()));
      emit(state.copyWith(firebaseStatus: Status.initial));
    }
  }
}