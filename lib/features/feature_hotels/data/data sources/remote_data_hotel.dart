import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/features/feature_hotels/data/models/hotel_model.dart';

import '../../domain/entities/hotel.dart';

abstract class RemoteDataHotel {
  Future<List<HotelModel>> getHotels();
}

class RemoteDataHotelImp implements RemoteDataHotel {
  @override
  Future<List<HotelModel>> getHotels() async {
    List<HotelModel> hotels = [];

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('hotels').get();
    List<QueryDocumentSnapshot> queryDocumentSnapshot = querySnapshot.docs;
    for (var element in queryDocumentSnapshot) {
      Map<String, dynamic> data = element.data() as Map<String, dynamic>;
      hotels.add(HotelModel.fromJson(data));
    }

    return hotels;
  }
}
