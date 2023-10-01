import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_app/models/city_data.dart';
import 'package:travel_app/features/features_auth/presentation/screens/sign_in.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:travel_app/features/features_auth/presentation/screens/sign_up.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);
  static const String route = "GetStarted";

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String city = " ";
    TextEditingController ctrl = TextEditingController();
    bool record = false;
    SpeechToText speech = SpeechToText();
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.only(top: height * 0.08),
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo.png",
            height: height * 0.2,
            width: width * 0.6,
          ),
          RichText(
              text: const TextSpan(
                  text: "Travel\t",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  children: [
                TextSpan(
                    text: "App", style: TextStyle(color: Colors.redAccent)),
              ])),
          const Text("your tigeline here",
              style: TextStyle(
                fontSize: 14,
              )),
          SizedBox(
            height: height * 0.04,
          ),
          Center(
            child: SizedBox(
              width: width * 0.84,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return TypeAheadField<String?>(
                    suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                      constraints: BoxConstraints(maxHeight: 100),
                    ),
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: ctrl,
                      cursorColor: Colors.black12,
                      decoration: InputDecoration(
                        prefixIconColor: Colors.black54,
                        suffixIconColor: Colors.black54,
                        hintText: "City name",
                        suffixIcon: AvatarGlow(
                          glowColor: Colors.redAccent,
                          endRadius: 30,
                          animate: record,
                          child: GestureDetector(
                            child: const Icon(Icons.mic),
                            onLongPress: () async {
                              bool available = await speech.initialize();
                              if (!record) {
                                if (available) {
                                  setState(() {
                                    ctrl.clear();
                                    record = true;
                                    speech.listen(
                                      onResult: (result) {
                                        setState(() {
                                          city = result.recognizedWords;
                                          ctrl.text = city;
                                        });
                                      },
                                    );
                                  });
                                }
                              }
                            },
                            onTap: () {
                              setState(() {
                                speech.stop();
                                record = false;
                              });
                            },
                          ),
                        ),
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.black54),
                        ),
                      ),
                    ),
                    suggestionsCallback: CityData.getSuggestion,
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(suggestion!),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      ctrl.text = suggestion!;
                      city = suggestion!;
                    },
                    hideOnEmpty: true,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: height * 0.12,
          ),
          const Text(
            "Choose your city",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Colors.black87),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          const Text(
            "lorren ipsum dolor sit amet,"
            "\n consectetur adipiscing elit.Semper sed "
            "\n mattis vitae mattis dolor.",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.1),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SignUp(),
                    reverseTransitionDuration: Duration.zero,
                    transitionDuration: const Duration(milliseconds: 500),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(0, 1), end: Offset.zero)
                            .animate(animation),
                        child: child,
                      );
                    },
                  ));
            },
            style: ButtonStyle(
                padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                        horizontal: width * 0.26, vertical: height * 0.02))),
            child: const Text("Get Started", style: TextStyle(fontSize: 16)),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?",
                  style: TextStyle(color: Colors.black87)),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ));
                },
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 10.0), // Adjust the value as needed
                  child: Text(
                    "Log in",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black54),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
