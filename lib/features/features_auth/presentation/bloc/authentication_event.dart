part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class SignInWithGoogleEvent extends AuthenticationEvent {}

class SignInWithEmailAndPasswordEvent extends AuthenticationEvent {
  SignInWithEmailAndPasswordEvent(this.email, this.password, this.context);
  final String email;
  final String password;
  BuildContext context;
}

class AnonymousSignInEvent extends AuthenticationEvent {
  AnonymousSignInEvent(this.context);
  BuildContext context;
}

class SignUpEvent extends AuthenticationEvent {
  SignUpEvent(this.client, this.context);
  final Client client;
  BuildContext context;
}

class SignOutEvent extends AuthenticationEvent {
  SignOutEvent(this.context);
  BuildContext context;
}
