import 'package:dartz/dartz.dart';
import 'package:travel_app/features/features_auth/domain/repositories/auth_repository.dart';
import '../../../../core/error/failures.dart';

class AnonymousSignInUseCase {
  AnonymousSignInUseCase(this.repository);
  AuthRepository repository;
  Future<Either<Failure, Unit>> call() async {
    return await repository.anonymousSignIn();
  }
}
