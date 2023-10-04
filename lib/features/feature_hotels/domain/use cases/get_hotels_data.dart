import 'package:dartz/dartz.dart';
import 'package:travel_app/features/feature_hotels/domain/repositories/hotel_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/hotel.dart';

class GetHotelsDataUseCase {
  GetHotelsDataUseCase(this.repository);
  HotelRepository repository;
  Future<Either<Failure, List<Hotel>>> call() async {
    print("fffrrrrommmmmmmmmmmmmm Get hotels data use case");
    return await repository.getHotelsData();
  }
}
