import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/add_trip.dart';
import 'package:travel_app/screens/booking_screen.dart';
import 'package:travel_app/screens/confirm_booking.dart';
import 'package:travel_app/screens/favourites.dart';
import 'package:travel_app/screens/get_started.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/hotels_screen.dart';
import 'package:travel_app/screens/my_trips.dart';
import 'package:travel_app/screens/rooms_screen.dart';
import 'package:travel_app/screens/select_place.dart';
import 'package:travel_app/screens/sign_in.dart';
import 'package:travel_app/screens/sign_up.dart';
import 'core/design_color.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          AddTrip.route: (context) => AddTrip(),
          BookingScreen.route: (context) => const BookingScreen(),
          ConfirmBooking.route: (context) => ConfirmBooking(),
          Favourites.route: (context) => const Favourites(),
          GetStarted.route: (context) => const GetStarted(),
          HomeScreen.route: (context) => const HomeScreen(),
          HotelsScreen.route: (context) => const HotelsScreen(),
          MyTrips.route: (context) => const MyTrips(),
          SelectPlace.route: (context) => const SelectPlace(),
          SignIn.route: (context) => SignIn(),
          SignUp.route: (context) => SignUp(),
          RoomsScreen.route: (context) => const RoomsScreen()
        },
        theme: design,
        debugShowCheckedModeBanner: false,
        home: const GetStarted());
  }
}
