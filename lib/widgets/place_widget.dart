import 'package:flutter/material.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        double width = p1.maxWidth;
        double height = p1.maxHeight;
        return Padding(
          padding:  const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.black12, Colors.redAccent],
              ),
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadiusDirectional.circular(10),
            ),
            child: Row(children: [
              SizedBox(
                  height: height,
                  width: width * 0.35,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/paris.jpg",
                        fit: BoxFit.cover,
                      ))),
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.1,
                    bottom: height * 0.05,
                    right: width * 0.03,
                    left: width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Latin Quarter ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.location_pin,
                          color: Colors.white,
                          size: 17,
                        ),
                        Text(
                          "6th ,5 th arround",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.15,
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.03),
                            child: const Divider(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Icon(Icons.flight_takeoff,
                            color: Colors.white, size: 16),
                        SizedBox(
                          width: width * 0.15,
                          child: Padding(
                            padding: EdgeInsets.only(left: width * 0.03),
                            child: const Divider(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Container(
                          width: width * 0.19,
                          height: height * 0.19,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text("3000 \$",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
