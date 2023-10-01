import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/client.dart';
import '../repositories/auth_repository.dart';

class SignInWithGoogleUseCase {
  SignInWithGoogleUseCase(this.repository);
  final AuthRepository repository;
  Future<Either<Failure, Client>> call() async {
    return await repository.signInWithGoogle();
  }
}
