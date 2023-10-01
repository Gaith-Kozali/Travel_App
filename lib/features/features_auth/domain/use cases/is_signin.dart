import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
class IsSignInUseCase {
  bool call() {
    return FirebaseAuth.instance.currentUser == null ? false : true;
  }
}
