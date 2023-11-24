part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class EventAuthInitial extends AuthEvent {}

class EventAuthLogin extends AuthEvent {
  final String login;
  final String password;

  EventAuthLogin(this.login, this.password);
}

class EventAuthLogout extends AuthEvent {}
