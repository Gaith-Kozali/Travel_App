
import 'package:flutter/material.dart';

import '../screens/sign_up.dart';

class SignUpButton extends StatelessWidget {
   SignUpButton({super.key,  required this.width});
  double width;

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
          width: width * 0.85,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, SignUp.route);
            },
            style: ButtonStyle(
                backgroundColor:
                const MaterialStatePropertyAll<Color>(
                    Colors.white),
                shape: MaterialStatePropertyAll<
                    RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(
                          color: Colors.black45)),
                ),
                padding: const MaterialStatePropertyAll<
                    EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 18))),
            child: const Text("Sign up",
                style:
                TextStyle(fontSize: 16, color: Colors.black)),
          ));
  }

}