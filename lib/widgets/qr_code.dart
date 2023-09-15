import 'dart:math';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart' ;

class QrCode extends StatelessWidget {
  QrCode(
      {Key? key,
      required this.height,
      required this.width,
      required this.animation})
      : super(key: key);
  final double width;
  final double height;
  AnimationController animation;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.25,
      width: width * 0.95,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadiusDirectional.circular(10),
        color: Colors.white,
      ),
      child: Transform(
          transform: Matrix4.rotationX(pi),
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                  onPressed: () {
                    animation.reverse();
                  },
                  icon: const Icon(
                    Icons.rotate_left_sharp,
                    color: Colors.red,
                  )),
              Center(
                child: SizedBox(
                  width: width * 0.9,
                  height: height * 0.25,
                  child: FittedBox(
                    child: Row(
                      children: [
                        QrImageView(
                          data: '1234567890',
                          version: QrVersions.auto,
                          size: height*0.2 ,
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        const Text("Please clear the QR code of the trip",
                            style: TextStyle(fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
