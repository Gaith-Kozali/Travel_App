import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/core/error/failures.dart';

class SignOutUseCase {
  Future<Either<Failure, Unit>> call() async {
    try {
      print(FirebaseAuth.instance.currentUser);
      await FirebaseAuth.instance.signOut();
      print("----------------------------------- after");
      print(FirebaseAuth.instance.currentUser);
      print("corrrect");
      return const Right(unit);
    } catch (e) {
      print(e);
      return Left(SignOutFailure());
    }
  }
}
