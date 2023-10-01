part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class ErrorAuthenticationState extends AuthenticationState {
  ErrorAuthenticationState({required this.message});
  String message;
}

class SignInState extends AuthenticationState {
  SignInState({required this.client});
  Client client;
}

class WaitState extends AuthenticationState {}
