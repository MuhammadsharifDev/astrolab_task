part of 'main_bloc.dart';

class MainState extends Equatable {
  final Status signOutState;
  final String errorMessage;

  const MainState({
    this.signOutState = Status.initial,
    this.errorMessage = '',
  });

  MainState copyWith({
    Status? signOutState,
    String? errorMessage,
  }) {
    return MainState(
      signOutState: signOutState ?? this.signOutState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [signOutState, errorMessage];
}

enum Status { initial, loading, success, error }

extension FireebaseStatusX on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}