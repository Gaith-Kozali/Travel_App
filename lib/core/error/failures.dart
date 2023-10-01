import 'package:equatable/equatable.dart';

abstract class Failure {
  String call();
}

class GoogleSignInFailure extends Failure {
  @override
  String call() {
    return "google sign in error";
  }
}

class SignInWithEmailAndPasswordFailure extends Failure {
  @override
  String call() {
    return "SignIn With Email And Password Failure";
  }
}

class NoUserFound extends Failure {
  @override
  String call() {
    return "No user found for that email.";
  }
}

class WrongPasswordProvider extends Failure {
  @override
  String call() {
    return 'Wrong password provided for that user.';
  }
}

class AnonymousSignInFailure extends Failure {
  @override
  String call() {
    return "anonymous sign in error";
  }
}

class SignUpFailure extends Failure {
  @override
  String call() {
    return "signup failure";
  }
}

class WeakPasswordProvider extends Failure {
  @override
  String call() {
    return "The password provided is too weak";
  }
}

class AccountAlreadyExists extends Failure {
  @override
  String call() {
    return "The account already exists for that email";
  }
}

class SignOutFailure extends Failure {
  @override
  String call() {
    return "sign out failure";
  }

}