import 'package:dartz/dartz.dart';

import 'package:travel_app/features/feature_hotels/data/models/hotel_model.dart';
import 'package:travel_app/features/feature_hotels/domain/entities/hotel.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/hotel_repository.dart';
import '../data sources/remote_data_hotel.dart';

class HotelRepositoryImp implements HotelRepository {
  HotelRepositoryImp(this.remoteDataHotel);
  RemoteDataHotel remoteDataHotel;

  @override
  Future<Either<Failure, List<HotelModel>>> getHotelsData() async {
    try {
      return Right(await remoteDataHotel.getHotels());
    } catch (e) {
    return Left(SignOutFailure());
    }
  }


}
