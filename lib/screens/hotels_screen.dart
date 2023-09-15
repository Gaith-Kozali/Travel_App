import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/dash_lines.dart';
import '../widgets/hotel.dart';
import '../widgets/room.dart';
import '../widgets/pop_icon.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({Key? key}) : super(key: key);
  static const String route ="HotelsScreen";

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          leading: const PopIcon(),
          title: const Text(
            "Hotels",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.black12,
          centerTitle: true,
          expandedHeight: height * 0.2,
          flexibleSpace: FlexibleSpaceBar(
            background: SizedBox(
              height: height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: const Icon(Icons.location_on,
                            color: Colors.redAccent, size: 20),
                      ),
                      const Text(
                        "Paris, France",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.01, horizontal: width * 0.05),
                    child: DashLines(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.date_range_outlined),
                      const Text("24,04-25,04"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      const Icon(Icons.people),
                      const Text("1 guest, 1 room"),
                      SizedBox(
                        width: width * 0.1,
                      ),
                      TextButton(
                        style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll<Color>(
                            Colors.black12,
                          ),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              builder: (context) => Container(
                                  height: height * 0.4,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(50)))),
                              context: context);
                        },
                        child: const Text(
                          "Filter Results",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black45),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            centerTitle: true,
            titlePadding:
                EdgeInsets.only(left: width * 0.05, bottom: height * 0.01),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(childCount: 4, (context, index) {
            return SizedBox(height: height * 0.35, child: const Hotel());
          }),
        )
      ]),
    );
  }
}
