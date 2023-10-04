import 'package:dartz/dartz.dart';
import 'package:travel_app/features/feature_hotels/domain/entities/hotel.dart';
import '../../../../core/error/failures.dart';

abstract class HotelRepository {
Future<Either<Failure,List<Hotel>>> getHotelsData();
}
