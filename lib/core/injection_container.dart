import 'package:get_it/get_it.dart';
import 'package:travel_app/features/feature_hotels/data/data%20sources/remote_data_hotel.dart';
import 'package:travel_app/features/feature_hotels/data/repositories/hotel_repository_imp.dart';
import 'package:travel_app/features/feature_hotels/domain/repositories/hotel_repository.dart';
import 'package:travel_app/features/feature_hotels/domain/use%20cases/get_hotels_data.dart';
import 'package:travel_app/features/feature_hotels/presentation/bloc/hotels_bloc.dart';
import 'package:travel_app/features/features_auth/data/data%20sources/remote_data_source.dart';
import 'package:travel_app/features/features_auth/domain/repositories/auth_repository.dart';
import 'package:travel_app/features/features_auth/domain/use%20cases/anonymous_signin.dart';
import 'package:travel_app/features/features_auth/domain/use%20cases/sign_out.dart';
import 'package:travel_app/features/features_auth/domain/use%20cases/sign_up.dart';
import 'package:travel_app/features/features_auth/domain/use%20cases/signin_with_email_and_password.dart';
import 'package:travel_app/features/features_auth/domain/use%20cases/signin_with_google.dart';
import 'package:travel_app/features/features_auth/presentation/bloc/authentication_bloc.dart';
import '../features/features_auth/data/repositories/auth_repository_imp.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // feature auth
// bloc
  sl.registerFactory(() => AuthenticationBloc(
      signUp: sl(),
      googleSignIn: sl(),
      emailSignIn: sl(),
      anonymousSignIn: sl(),
      signOut: sl()));
  // use case in authentication
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignInWithGoogleUseCase(sl()));
  sl.registerLazySingleton(() => SignInWithEmailAndPasswordUseCase(sl()));
  sl.registerLazySingleton(() => AnonymousSignInUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase());
  // repositoryImp
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(sl()));
  // data source in authentication
  sl.registerLazySingleton<RemoteDataSourceAuth>(
      () => RemoteDataSourceAuthFireBase());
// injection bloc hotels
  sl.registerFactory(() => HotelsBloc(getHotelsDataUseCase: sl()));
  sl.registerLazySingleton(() => GetHotelsDataUseCase(sl()));
  sl.registerLazySingleton<HotelRepository>(() => HotelRepositoryImp(sl()));
  sl.registerLazySingleton<RemoteDataHotel>(() => RemoteDataHotelImp());
}
