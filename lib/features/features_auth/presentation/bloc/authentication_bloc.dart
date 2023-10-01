import 'package:flutter/material.dart';
import 'package:travel_app/features/features_auth/domain/entities/client.dart';
import 'package:travel_app/features/features_auth/domain/use cases/signin_with_google.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_app/features/features_auth/domain/use%20cases/signin_with_email_and_password.dart';
import '../../../../core/error/failures.dart';
import '../../../../screens/home_screen.dart';
import '../../domain/use cases/anonymous_signin.dart';
import '../../domain/use cases/sign_out.dart';
import '../../domain/use cases/sign_up.dart';
import '../screens/sign_in.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SignInWithGoogleUseCase googleSignIn;
  final SignInWithEmailAndPasswordUseCase emailSignIn;
  final SignUpUseCase signUp;
  final AnonymousSignInUseCase anonymousSignIn;
  final SignOutUseCase signOut;
  AuthenticationBloc(
      {required this.googleSignIn,
      required this.emailSignIn,
      required this.anonymousSignIn,
      required this.signUp,
      required this.signOut})
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is SignInWithGoogleEvent) {
        final information = await googleSignIn();
        information.fold((failure) {
          print(failure.call());
          emit(ErrorAuthenticationState(message: failure.call()));
        }, (client) {
          print("sucessssssss");
          SignInState(client: client);
        });
      } else if (event is SignInWithEmailAndPasswordEvent) {
        emit(WaitState());
        final information = await emailSignIn(event.email, event.password);
        information.fold((failure) {
          emit(ErrorAuthenticationState(message: failure.call()));
          print("bloccccc in ErrorAuthenticationState");
        }, (client) {
          emit(SignInState(client: client));
          Navigator.pushReplacementNamed(event.context, HomeScreen.route);
        });
      } else if (event is AnonymousSignInEvent) {
        emit(WaitState());
        final information = await anonymousSignIn();

        information.fold(
            (failure) =>
                emit(ErrorAuthenticationState(message: failure.call())),
            (client) {
          SignInState(client: Client(email: "anonymous", isLogin: true));
          Navigator.pushReplacementNamed(event.context, HomeScreen.route);
          print("sign in anonymousSignIn is doneeeeeeeeeeeeeeeeeeee");
        });
      } else if (event is SignUpEvent) {
        emit(WaitState());
        final information = await signUp(event.client);
        information.fold(
            (failure) =>
                emit(ErrorAuthenticationState(message: failure.call())),
            (client) {
          emit(SignInState(client: client));
          print(
              "sign uuuuuuuuuup doneeeeeeeeeeeeeeeeeeee in AuthenticationBloc herrrreee ");

          Navigator.pushReplacementNamed(event.context, HomeScreen.route);
        });
      } else if (event is SignOutEvent) {
        emit(WaitState());
        final data = await signOut();
        data.fold((error) {
          emit(ErrorAuthenticationState(message: error.call()));
        }, (correct) {
          emit(AuthenticationInitial());
          print("sign out correct in the auth bloc");
          Navigator.of(event.context).pushReplacementNamed(SignIn.route);
        });
      }
    });
  }
}
