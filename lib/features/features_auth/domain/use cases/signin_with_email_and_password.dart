import 'package:dartz/dartz.dart';
import 'package:travel_app/features/features_auth/domain/repositories/auth_repository.dart';
import '../../../../core/error/failures.dart';
import '../entities/client.dart';

class SignInWithEmailAndPasswordUseCase {
  SignInWithEmailAndPasswordUseCase(this.repository);
  final AuthRepository repository;
  Future<Either<Failure, Client>> call(
    String email,
    String password
  ) async {
  final test = await repository.signInWithEmailAndPassword(email, password);
  test.fold((l) => print(l.call()) , (r) => print(r));
    return test;
  }
}
