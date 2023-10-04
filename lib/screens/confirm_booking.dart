import 'dart:developer';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/features/feature_hotels/presentation/widgets/dash_lines.dart';
import 'package:travel_app/widgets/service.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/pop_icon.dart';

import '../core/design_color.dart';

class ConfirmBooking extends StatelessWidget {
  ConfirmBooking({Key? key}) : super(key: key);
  static const String route ="ConfirmBooking";
  List<String> name = [
    "12 m",
    " 1 double bed room",
    "Ac",
    "bath",
    "free Wi-Fi",
    "television",
    "ironing facilities",
  ];
  bool? profileEmail = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          leading: const PopIcon(),
          title: const Text(
            "Confirm Booking",
            style: TextStyle(color: Colors.black),
          )),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: height * 0.01),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                width: width * 0.9,
                height: height * 0.38,
                child: Column(children: [
                  Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/bedroom.jpg",
                        height: height * 0.16,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                        bottom: 8,
                        left: 10,
                        child: Text(
                          "Double room with one bed",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 19),
                        ))
                  ]),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03, vertical: height * 0.01),
                    child: Column(
                      children: [
                        Service(
                          names: name,
                          width: width,
                          height: height,
                          see: false,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        DashLines(),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("price", style: TextStyle(fontSize: 15)),
                            Text("\$116", style: TextStyle(fontSize: 15))
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        DashLines(),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tex", style: TextStyle(fontSize: 15)),
                            Text("\$5", style: TextStyle(fontSize: 15))
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        DashLines(),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total", style: TextStyle(fontSize: 15)),
                            Text("\$121", style: TextStyle(fontSize: 15))
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                  padding: EdgeInsets.only(
                      right: width * 0.69, bottom: height * 0.01),
                  child: const Text(
                    "Full name",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )),
              SizedBox(
                width: width * 0.9,
                child: TextFormField(
                  cursorColor: Colors.black12,
                  decoration: fieldDesign.copyWith(
                    hintText: "full name",
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      right: width * 0.69,
                      bottom: height * 0.01,
                      top: height * 0.01),
                  child: const Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )),
              SizedBox(
                width: width * 0.9,
                child: TextFormField(
                  cursorColor: Colors.black12,
                  decoration: fieldDesign.copyWith(
                    hintText: "example@gmail.com",
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: color,
                checkboxShape: const CircleBorder(),
                value: profileEmail,
                onChanged: (value) => profileEmail = value,
                title: const Text("Use my profile email"),
              ),
              SizedBox(height: height * 0.01),
              const Text(
                "Payment method",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: SvgPicture.asset("assets/payment/master_card.svg",
                        width: 30, height: 30),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: SvgPicture.asset("assets/payment/paypal.svg",
                        width: 40, height: 40),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: SvgPicture.asset("assets/payment/visa.svg",
                        width: 40, height: 40),
                    onTap: () {},
                  )
                ],
              ),
              SizedBox(height: height * 0.01),
              SizedBox(
                width: width * 0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 18))),
                  child: const Text("Next", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          )),
    );
  }
}
