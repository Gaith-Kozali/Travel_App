import 'package:flutter/material.dart';

import '../widgets/place_widget.dart';
import '../widgets/pop_icon.dart';

class SelectPlace extends StatelessWidget {
  const SelectPlace({Key? key}) : super(key: key);
  static const String route ="SelectPlace";


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(
                      horizontal: width * 0.35, vertical: height * 0.022))),
          child: const Text("Create", style: TextStyle(fontSize: 16)),
        ),
        appBar: AppBar(
          title: const Text("Select Place",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.black)),
          leading: const PopIcon(),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.02)
              .copyWith(bottom: height * 0.1),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Column(
              children: [
                if (index == 0)
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
                      ),
                    ],
                  ),
                if (index == 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: SizedBox(
                      width: width * 0.8,
                      height: 60,
                      child: TextField(
                        cursorColor: Colors.black12,
                        decoration: InputDecoration(
                            prefixIconColor: Colors.black54,
                            suffixIconColor: Colors.black54,
                            hintText: "Search Place",
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.mic,
                              ),
                              onPressed: () {},
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.black54))),
                      ),
                    ),
                  ),
                if (index == 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        " 1 Waypoints added",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                            overlayColor: MaterialStatePropertyAll<Color>(
                                Colors.black12)),
                        child: const Text(
                          "EditList",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black54),
                        ),
                      )
                    ],
                  ),
                SizedBox(
                  height: height * 0.24,
                  width: width * 0.9,
                  child: const PlaceWidget(),
                )
              ],
            );
          },
        ));
  }
}
