import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Countries extends StatefulWidget {
  const Countries({Key? key}) : super(key: key);

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  ScrollController ctrl = ScrollController();
  late Widget scrolleIcon;
  Alignment positiom = Alignment.centerRight;
  IconButton EndButton() {
    return IconButton(
        onPressed: () {
          ctrl.animateTo(ctrl.position.maxScrollExtent,
              duration: const Duration(seconds: 1), curve: Curves.linear);
        },
        icon: const Icon(
          Icons.arrow_circle_right,
          color: Colors.white,
          size: 30,
        ));
  }

  IconButton StartButton() {
    return IconButton(
        onPressed: () {
          ctrl.animateTo(0.0,
              duration: const Duration(seconds: 1), curve: Curves.linear);
        },
        icon: const Icon(
          Icons.arrow_circle_left,
          color: Colors.white,
          size: 30,
        ));
  }

  void scroller() {
    if (ctrl.position.atEdge) {
      if (ctrl.position.pixels == 0) {
        setState(() {
          scrolleIcon = EndButton();
          positiom = Alignment.centerRight;
        });
      } else if (ctrl.position.atEdge) {
        setState(() {
          scrolleIcon = StartButton();
          positiom = Alignment.centerLeft;
        });
      }
    } else {
      setState(() {
        scrolleIcon = const SizedBox();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    scrolleIcon = EndButton();
    ctrl.addListener(scroller);
  }

  @override
  void dispose() {
    super.dispose();
    ctrl.dispose();
    ctrl.removeListener(scroller);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SizedBox(
            height: height * 0.35,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Country",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        TextButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                              overlayColor: MaterialStatePropertyAll<Color>(
                                  Colors.black12)),
                          child: const Text(
                            "See all",
                            style: TextStyle(
                                color: Colors.black45,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ]),
                  SizedBox(
                      height: height * 0.28,
                      child: Stack(
                        alignment: positiom,
                        children: [
                          ListView.builder(
                            controller: ctrl,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.01),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                                top: Radius.circular(15)),
                                        child: Image.asset(
                                          "assets/bedroom.jpg",
                                          width: width * 0.43,
                                          height: height * 0.21,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Text("Dubai",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                      RatingBar.builder(
                                        initialRating: 3,
                                        direction: Axis.horizontal,
                                        itemCount: 5,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star_sharp,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                        ignoreGestures: true,
                                        allowHalfRating: true,
                                        itemSize: 17,
                                      ),
                                      SizedBox(
                                        height: height * 0.001,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                          ),
                          scrolleIcon,
                        ],
                      ))
                ])));
  }
}
