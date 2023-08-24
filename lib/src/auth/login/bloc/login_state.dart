part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  final Status firebaseStatus;
  final String errorMessage;

  const LoginState({
    this.firebaseStatus = Status.initial,
    this.errorMessage = '',
  });

  LoginState copyWith({
    Status? firebaseStatus,
    String? errorMessage,
  }) {
    return LoginState(
      firebaseStatus: firebaseStatus ?? this.firebaseStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [firebaseStatus, errorMessage];
}

enum Status { initial, loading, success, error }

extension FirebaseStatus on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}