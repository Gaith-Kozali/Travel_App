import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/core/design_color.dart';
import 'package:travel_app/features/features_auth/presentation/bloc/authentication_bloc.dart';
import 'package:travel_app/features/features_auth/presentation/widgets/name_field.dart';
import '../../domain/entities/client.dart';
import '../widgets/password_field.dart';

class SignUp extends StatelessWidget {
  static const String route = "SignUp";
  SignUp({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _ctrlDate = TextEditingController();
  Client client = Client(isLogin: false);
  var myFormat = DateFormat('d-MM-yyyy');
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is WaitState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04)
                      .copyWith(bottom: height * 0.07, top: height * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Create new account",
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
                    key: _formKey,
                    child: Column(
                      children: [
                        NameField(
                          width: width,
                          firstNameSave: (p0) => client.firstName = p0,
                          lastNameSave: (p0) => client.lastName = p0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                right: width * 0.65,
                                bottom: height * 0.01,
                                top: height * 0.015),
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
                                return "write the email";
                              } else if (!value.endsWith("@gmail.com")) {
                                return "email must be @gmail.com";
                              }
                            },
                            onSaved: (newValue) {
                              client.email = newValue;
                            },
                          ),
                        ),
                        PasswordField(
                          width: width,
                          height: height,
                          save: (newValue) {
                            client.password = newValue;
                          },
                          autofill: false,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                right: width * 0.66,
                                bottom: height * 0.01,
                                top: height * 0.02),
                            child: const Text(
                              "Phone",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            )),
                        SizedBox(
                          width: width * 0.85,
                          child: TextFormField(
                            cursorColor: Colors.black12,
                            decoration: fieldDesign,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "enter your phone number";
                              } else if (value.length < 10) {
                                return "not correct number";
                              }
                            },
                            onSaved: (newValue) {
                              client.phone = newValue;
                            },
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                right: width * 0.56,
                                bottom: height * 0.01,
                                top: height * 0.02),
                            child: const Text(
                              "Date of birth",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            )),
                        SizedBox(
                          width: width * 0.85,
                          child: TextFormField(
                            controller: _ctrlDate,
                            cursorColor: Colors.black12,
                            decoration: fieldDesign,
                            readOnly: true,
                            onTap: () async {
                              date = await showDatePicker(
                                context: context,
                                initialDate: DateTime(2000),
                                firstDate: DateTime(1920),
                                lastDate: DateTime.now(),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: Colors.redAccent,
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                            primary: Colors.black87),
                                      ),
                                    ),
                                    child: child ?? Container(),
                                  );
                                },
                              );
                              if (date != null) {
                                _ctrlDate.text = myFormat.format(date!);
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "enter your date of birth";
                              }
                            },
                            onSaved: (newValue) {
                              client.date = newValue;
                            },
                          ),
                        )
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: height * 0.05, top: height * 0.05),
                    child: SizedBox(
                      width: width * 0.85,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            BlocProvider.of<AuthenticationBloc>(context)
                                .add(SignUpEvent(client, context));
                          }
                        },
                        style: const ButtonStyle(
                            padding:
                                MaterialStatePropertyAll<EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(vertical: 18))),
                        child: const Text("Sign up",
                            style: TextStyle(fontSize: 16)),
                      ),
                    )),
              ],
            ));
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
    );
  }
}
