import 'dart:math';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/qr_code.dart';

class TripWidget extends StatefulWidget {
  const TripWidget({
    Key? key,
    required this.height,
    required this.width,
    this.information,
  }) : super(key: key);

  final double width;
  final double height;
  final Map<String, String>? information;

  @override
  State<TripWidget> createState() => _TripWidgetState();
}

class _TripWidgetState extends State<TripWidget> with TickerProviderStateMixin {
  late AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        double angle = animation.value * pi;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..rotateX(angle),
          child: angle >= pi / 2
              ? QrCode(
                  width: widget.width,
                  height: widget.height,
                  animation: animation,
                )
              : Container(
                  height: widget.height * 0.25,
                  width: widget.width * 0.95,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: Colors.white,
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/paris.jpg",
                              fit: BoxFit.cover,
                              width: widget.width * 0.35,
                              height: widget.height,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: widget.width * 0.02,
                              vertical: widget.height * 0.02,
                            ),
                            child: SizedBox(
                              width: widget.width * 0.55,
                              child: FittedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            text: "Bucharest OTP\n",
                                            style: TextStyle(
                                              color: Colors.black54,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: "06:40",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: widget.width * 0.05,
                                          child: const Divider(
                                            color: Colors.black,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.flight_takeoff,
                                          color: Colors.redAccent,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: widget.width * 0.05,
                                          child: const Divider(
                                            color: Colors.black,
                                          ),
                                        ),
                                        RichText(
                                          text: const TextSpan(
                                            text: "Rome CIA\n",
                                            style: TextStyle(
                                              color: Colors.black54,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: "09:40",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: widget.height * 0.02,
                                    ),
                                    const Text(
                                      "1hr 55min",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    SizedBox(
                                      height: widget.height * 0.04,
                                    ),
                                    const Text(
                                      "10:5:2023 - 20:5:2023",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: widget.height * 0.01,
                                    ),
                                    const Text(
                                      "12 Way points",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            animation.forward();
                          });
                        },
                        icon: const Icon(
                          size: 30,
                          Icons.qr_code,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
