import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/features_auth/presentation/bloc/authentication_bloc.dart';
import 'package:travel_app/features/features_auth/presentation/screens/sign_in.dart';
import 'package:travel_app/features/feature_profile/presentation/widgets/user_information.dart';
import '../../../features_auth/domain/entities/client.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  static const String route = "Profile";
  Future<void> signOut(BuildContext context) async {
    if (FirebaseAuth.instance.currentUser != null) {
      print(FirebaseAuth.instance.currentUser);
      await FirebaseAuth.instance.signOut();
      print("----------------------------------- after");
      print(FirebaseAuth.instance.currentUser);
    }
    print("corrrect");
    Navigator.pushNamed(context, SignIn.route);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.black45,
                ))
          ],
          title: const Text(
            "Edit profile",
            style: TextStyle(color: Colors.black),
          )),
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is WaitState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SignInState) {
            Client client = state.client;
            return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                        horizontal: width * 0.06, vertical: height * 0.03)
                    .copyWith(top: height * 0.02),
                child: Column(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/bedroom.jpg"),
                      radius: 80,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    SizedBox(
                      height: height * 0.43,
                      child: UserInformation(client: client),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    SizedBox(
                      width: width * 0.85,
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(SignOutEvent(context));
                        },
                        style: const ButtonStyle(
                            padding:
                                MaterialStatePropertyAll<EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(vertical: 18))),
                        child: const Text("Sign Out",
                            style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ));
          } else {
            return const SizedBox();
          }
        },
        listener: (BuildContext context, AuthenticationState state) {
          if (state is ErrorAuthenticationState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          }
        },
      ),
    );
  }
}
