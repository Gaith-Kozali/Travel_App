import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_app/core/design_color.dart';
import 'package:travel_app/screens/favourites.dart';
import 'package:travel_app/screens/get_started.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/hotels_screen.dart';
import 'package:travel_app/screens/my_trips.dart';
import 'package:travel_app/screens/sign_up.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  static const String route = "SignIn";
  bool visibility = false;
  UserCredential? userCredential;

  void anonymousSignin() async {
    try {
      userCredential = await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: AutofillGroup(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04)
                    .copyWith(bottom: height * 0.09, top: height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Sign in to your account",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                      style: const ButtonStyle(
                        overlayColor: MaterialStatePropertyAll<Color>(
                          Colors.black12,
                        ),
                      ),
                      onPressed:() {
                    anonymousSignin();
                    Navigator.pushNamed(context, HomeScreen.route);
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black45),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      right: width * 0.69, bottom: height * 0.01),
                  child: const Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )),
              SizedBox(
                width: width * 0.85,
                child: TextFormField(
                  cursorColor: Colors.black12,
                  decoration: fieldDesign.copyWith(
                    hintText: "example@gmail.com",
                  ),
                  autofillHints: const [AutofillHints.email],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: width * 0.64,
                    bottom: height * 0.01,
                    top: height * 0.02),
                child: const Text("Password",
                    style: TextStyle(fontWeight: FontWeight.w700)),
              ),
              StatefulBuilder(
                builder: (context, setState) => SizedBox(
                  width: width * 0.85,
                  child: TextFormField(
                    obscureText: !visibility,
                    cursorColor: Colors.black12,
                    decoration: fieldDesign.copyWith(
                      prefixIcon: IconButton(
                        icon: Icon(
                            visibility
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black38),
                        onPressed: () {
                          setState(
                            () {
                              visibility = !visibility;
                            },
                          );
                        },
                      ),
                    ),
                    autofillHints: const [AutofillHints.password],
                    onEditingComplete: () => TextInput.finishAutofillContext(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.5,
                    top: height * 0.01,
                    bottom: height * 0.04),
                child: TextButton(
                  style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll<Color>(
                      Colors.black12,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Forget password?",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black45),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.85,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, HomeScreen.route);
                  },
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 18))),
                  child: const Text("Log in", style: TextStyle(fontSize: 16)),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              const Text(
                "or",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5).copyWith(bottom: 0),
                    child: GestureDetector(
                      onTap: signInWithGoogle,
                      child: SvgPicture.asset("assets/google.svg",
                          width: 40, height: 40),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: 50,
                      )),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.apple,
                        color: Colors.black,
                        size: 50,
                      )),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.09, bottom: height * 0.01),
                child: const Text("Don't have an account?",
                    style: TextStyle(color: Colors.black45)),
              ),
              SizedBox(
                  width: width * 0.85,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUp.route);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll<Color>(Colors.white),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(color: Colors.black45)),
                        ),
                        padding:
                            const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(vertical: 18))),
                    child: const Text("Sign up",
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
