part of 'signup_bloc.dart';

@immutable
class SignupState extends Equatable {
  final Status updateState;
  final String errorMessage;

  const SignupState({
    this.updateState = Status.initial,
    this.errorMessage = '',
  });

  SignupState copyWith({
    Status? updateState,
    String? errorMessage,
  }) {
    return SignupState(
      updateState: updateState ?? this.updateState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [updateState, errorMessage];
}

enum Status { initial, loading, success, error }

extension FireebaseStatusX on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}