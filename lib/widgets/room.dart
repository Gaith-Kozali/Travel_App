import 'dart:math';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/booking_screen.dart';
import 'package:travel_app/widgets/service.dart';

class Room extends StatefulWidget {
  const Room({Key? key}) : super(key: key);

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  List<String> name = [
    "12 m",
    " 1 double bed room",
    "Ac",
    "bath",
    "free Wi-Fi",
    "television",
    "ironing facilities",
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        double width = p1.maxWidth;
        double height = p1.maxHeight;
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
          margin: EdgeInsets.symmetric(
              vertical: height * 0.05, horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/bedroom.jpg",
                    height: height * 0.43, width: width, fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.02,
                ).copyWith(right: width * 0.3),
                child: const FittedBox(
                  child: Text("Double room with 1 bed",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Service(names: name, height: height, width: width,see: true),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const FittedBox(
                      child: Text("118\$/per night",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.01),
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Book Now",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              reverseTransitionDuration: Duration.zero,
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return AnimatedBuilder(
                                  animation: animation,
                                  builder: (context, child) {
                                    return Transform(
                                      transform: Matrix4.rotationZ(-3 * pi / 2 -
                                          pi / 2 * animation.value),
                                      alignment: Alignment.topCenter,
                                      child: child,
                                    );
                                  },
                                  child: child,
                                );
                              },
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return const BookingScreen();
                              },
                            ));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
