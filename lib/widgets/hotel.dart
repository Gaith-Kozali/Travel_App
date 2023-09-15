import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/screens/rooms_screen.dart';

import '../core/design_color.dart';

class Hotel extends StatelessWidget {
  const Hotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (p0, p1) {
      double width = p1.maxWidth;
      double height = p1.maxHeight;
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.03),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoomsScreen.route);
              },
              child: Card(
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset("assets/bedroom.jpg",
                              height: height * 0.65,
                              width: width,
                              fit: BoxFit.cover),
                          Positioned(
                            left: 15,
                            bottom: 5,
                            child: Row(
                              children: [
                                Icon(Icons.location_on, color: color),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                const Text(
                                  "paris",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 19),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.08,
                              top: height * 0.02,
                              bottom: height * 0.02),
                          child: Row(
                            children: [
                               Icon(Icons.hotel_outlined,color: color),
                              SizedBox(width: width * 0.02),
                              const Text(
                                "Four session",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              )
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.07),
                        child: RatingBar.builder(
                          initialRating: 3,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star_sharp,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                          ignoreGestures: true,
                          allowHalfRating: true,
                          itemSize: 20,
                        ),
                      )
                    ],
                  ))),
        ),
      );
    });
  }
}
