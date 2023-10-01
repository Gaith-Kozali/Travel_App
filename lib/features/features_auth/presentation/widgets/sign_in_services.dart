import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/authentication_bloc.dart';

class SignInServices extends StatelessWidget {
   SignInServices({Key? key, required this.width}) : super(key: key);
double width;
  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5).copyWith(bottom: 0),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(SignInWithGoogleEvent());
            },
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
    );
  }
}
