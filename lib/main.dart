import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/feature_hotels/data/repositories/hotel_repository_imp.dart';
import 'package:travel_app/features/feature_hotels/domain/use%20cases/get_hotels_data.dart';
import 'package:travel_app/features/feature_hotels/presentation/bloc/hotels_bloc.dart';
import 'package:travel_app/screens/booking_screen.dart';
import 'package:travel_app/screens/confirm_booking.dart';
import 'package:travel_app/features/features_auth/presentation/screens/get_started.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/rooms_screen.dart';
import 'package:travel_app/screens/select_place.dart';
import 'package:travel_app/features/features_auth/presentation/screens/sign_in.dart';
import 'package:travel_app/features/features_auth/presentation/screens/sign_up.dart';
import 'core/design_color.dart';
import 'core/injection_container.dart' as injection;
import 'features/feature_hotels/data/data sources/remote_data_hotel.dart';
import 'features/features_auth/domain/use cases/is_signin.dart';
import 'features/features_auth/presentation/bloc/authentication_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await injection.init();
  RemoteDataHotelImp().getHotels();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => injection.sl<AuthenticationBloc>()),
          BlocProvider(
              create: (context) =>
                  injection.sl<HotelsBloc>()..add(GetDataHotelsEvent()))
        ],
        child: MaterialApp(
            routes: {
              BookingScreen.route: (context) => const BookingScreen(),
              ConfirmBooking.route: (context) => ConfirmBooking(),
              GetStarted.route: (context) => const GetStarted(),
              HomeScreen.route: (context) => const HomeScreen(),
              SelectPlace.route: (context) => const SelectPlace(),
              SignIn.route: (context) => SignIn(),
              SignUp.route: (context) => SignUp(),
              RoomsScreen.route: (context) => const RoomsScreen()
            },
            theme: design,
            debugShowCheckedModeBanner: false,
            home: IsSignInUseCase().call()
                ? const HomeScreen()
                : const GetStarted()));
  }
}
