import 'package:dartz/dartz.dart';
import 'package:travel_app/features/features_auth/domain/repositories/auth_repository.dart';
import '../../../../core/error/failures.dart';
import '../entities/client.dart';

class SignUpUseCase {
  SignUpUseCase(this.repository);
  final AuthRepository repository;
  Future<Either<Failure, Client>> call(Client user) async {
    return await repository.signUp(user);
  }
}
