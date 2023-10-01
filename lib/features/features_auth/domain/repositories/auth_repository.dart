import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/client_model.dart';
import '../entities/client.dart';

abstract class AuthRepository {
  Future<Either<Failure, Client>> signInWithGoogle();
  Future<Either<Failure, Unit>> anonymousSignIn();
  Future<Either<Failure, Client>> signInWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure,Client >> signUp(Client user);
  Future<void> signInWithFacebook();
  Future<void> signInWithApple();
  
}
