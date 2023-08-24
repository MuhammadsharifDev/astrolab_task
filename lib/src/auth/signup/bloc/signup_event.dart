part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class ChangePasswordEvent extends SignupEvent {
  final String newPassword;

  ChangePasswordEvent({required this.newPassword});
}