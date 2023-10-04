import 'package:travel_app/features/feature_hotels/domain/entities/hotel.dart';

class HotelModel extends Hotel {
  HotelModel(
      {required super.name,
      required super.location,
      required super.evaluation,
      required super.roomAvailable});
  // name constructor $$$ factory can called with out object
  factory HotelModel.fromJson(Map<String, dynamic> data) {
    print((data['room available']).runtimeType);
    print((data['evaluation']).runtimeType);

    return HotelModel(
        name: data['name'],
        location: data['location'],
        evaluation: data['evaluation'],
        roomAvailable: data['room available']);
  }
}
