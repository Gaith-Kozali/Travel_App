import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_app/core/design_color.dart';
import 'package:travel_app/features/features_auth/data/data%20sources/remote_data_source.dart';
import 'package:travel_app/features/features_auth/data/repositories/auth_repository_imp.dart';
import 'package:travel_app/features/features_auth/domain/use%20cases/anonymous_signin.dart';
import 'package:travel_app/features/features_auth/presentation/bloc/authentication_bloc.dart';
import 'package:travel_app/features/features_auth/presentation/widgets/password_field.dart';
import 'package:travel_app/features/features_auth/presentation/widgets/sign_in_services.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/features/features_auth/presentation/screens/sign_up.dart';

import '../widgets/sign_up_button.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  static const String route = "SignIn";
  bool visibility = false;
  final formKey = GlobalKey<FormState>();
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: AutofillGroup(
          child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is WaitState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04)
                          .copyWith(bottom: height * 0.09, top: height * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Sign in to your account",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            style: const ButtonStyle(
                              overlayColor: MaterialStatePropertyAll<Color>(
                                Colors.black12,
                              ),
                            ),
                            onPressed: () {
                              BlocProvider.of<AuthenticationBloc>(context)
                                  .add(AnonymousSignInEvent(context));
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
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "enter the email";
                                } else if (!value.endsWith("@gmail.com")) {
                                  return "the email should be like @gmail.com";
                                }
                              },
                              onSaved: (newValue) {
                                email = newValue!;
                              },
                              autofillHints: const [AutofillHints.email],
                            ),
                          ),
                          PasswordField(
                            width: width,
                            height: height,
                            save: (value) {
                              password = value!;
                            },
                            autofill: true,
                          )
                        ],
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
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              BlocProvider.of<AuthenticationBloc>(context).add(
                                  SignInWithEmailAndPasswordEvent(
                                      email, password, context));
                            }
                          },
                          style: const ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll<EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(vertical: 18))),
                          child: const Text("Log in",
                              style: TextStyle(fontSize: 16)),
                        )),
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
                    SignInServices(width: width),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.09, bottom: height * 0.01),
                      child: const Text("Don't have an account?",
                          style: TextStyle(color: Colors.black45)),
                    ),
                    SignUpButton(width: width),
                  ],
                );
              }
            },
            listener: (context, state) {
              if (state is ErrorAuthenticationState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ));
              }
            },
          ),
        ),
      ),
    ));
  }
}
