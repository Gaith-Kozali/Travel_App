import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/design_color.dart';
import 'package:travel_app/screens/favourites.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/hotels_screen.dart';
import 'package:travel_app/screens/my_trips.dart';

class SignUp extends StatelessWidget {
  static const String route ="SignUp";
  SignUp({Key? key}) : super(key: key);
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child:   Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04)
                    .copyWith(bottom: height * 0.1, top: height * 0.07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Create new account",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                      style: const ButtonStyle(
                        overlayColor: MaterialStatePropertyAll<Color>(
                          Colors.black12,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context,
                         HomeScreen.route);
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
                      right: width * 0.65, bottom: height * 0.01),
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
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: width * 0.6,
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
                  ),
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(
                      right: width * 0.66, bottom: height * 0.01,top: height * 0.02),
                  child: const Text(
                    "Phone",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )),
              SizedBox(
                width: width * 0.85,
                child: TextFormField(
                  cursorColor: Colors.black12,
                  decoration: fieldDesign,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      right: width * 0.56, bottom: height * 0.01,top: height * 0.02),
                  child: const Text(
                    "Date of birth",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )),
              SizedBox(
                width: width * 0.85,
                child: TextFormField(
                  cursorColor: Colors.black12,
                  decoration: fieldDesign,
                  readOnly: true,
                  onTap: () async {
                  await showDatePicker(
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

                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: height * 0.05, top: height * 0.1),
                  child: SizedBox(
                    width: width * 0.85,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context,
                         HomeScreen.route);
                      },
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(vertical: 18))),
                      child:
                          const Text("Sign up", style: TextStyle(fontSize: 16)),
                    ),
                  )),

            ],
          ),
        ),
    );
  }
}
