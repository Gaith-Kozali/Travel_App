import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/features/features_auth/data/data%20sources/remote_data_source.dart';
import 'package:travel_app/features/features_auth/data/models/client_model.dart';
import 'package:travel_app/features/features_auth/domain/entities/client.dart';
import 'package:travel_app/features/features_auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  AuthRepositoryImp(this.remoteDataSource);
  RemoteDataSourceAuth remoteDataSource;
  @override
  Future<Either<Failure, Unit>> anonymousSignIn() async {
    try {
      await remoteDataSource.anonymousSignIn();
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      print(e);
      return Left(AnonymousSignInFailure());
    }
  }

  @override
  Future<Either<Failure, ClientModel>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
          await remoteDataSource.signInWithEmailAndPassword(email, password);

      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return Left(NoUserFound());
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return Left(WrongPasswordProvider());
      } else {
        print(
            "sign in with email error auth_ repositoryyyyy implement rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
        return Left(SignInWithEmailAndPasswordFailure());
      }
    }
  }

  @override
  Future<Either<Failure, ClientModel>> signInWithGoogle() async {
    try {
      return Right(await remoteDataSource.signInWithGoogle());
    } catch (e) {
      return Left(GoogleSignInFailure());
    }
  }

  @override
  Future<Either<Failure, ClientModel>> signUp(Client user) async {
    try {
      final client = await remoteDataSource.signUp(user);
      print(
          "in repositoryimolem of sign up after callllllllllllllllllllll remote data");
      return Right(client);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return Left(WeakPasswordProvider());
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return Left(AccountAlreadyExists());
      }
    } catch (e) {
      print(e);
      return Left(SignUpFailure());
    }
    return left(SignUpFailure());
  }

  @override
  Future<void> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }
}
