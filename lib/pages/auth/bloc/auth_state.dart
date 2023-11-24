part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class StateAuthInitial extends AuthState {}

class StateAuthLoading extends AuthState {}

class StateAuthConfirmed extends AuthState {}

class StateAuthRejected extends AuthState {
  final String message;
  StateAuthRejected(this.message);
}

class StateAuthLogout extends AuthState {}
