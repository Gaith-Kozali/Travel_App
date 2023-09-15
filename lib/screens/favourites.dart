import 'package:flutter/material.dart';
import '../widgets/cities_widget.dart';
import '../widgets/countries.dart';
import '../widgets/pop_icon.dart';


class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);
  static const String route ="Favourites";

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: const PopIcon(),
          title: const Text("Favorites",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.black)),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: height * 0.03),
          children: [
            Countries(),
            SizedBox(
              height: height * 0.02,
            ),
            CitiesWidget()
          ],
        ));
  }
}


