import 'package:flutter/material.dart';
import 'package:travel_app/screens/profile.dart';
import 'booking_screen.dart';
import 'favourites.dart';
import 'hotels_screen.dart';
import 'my_trips.dart';
import 'package:travel_app/core/design_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route ="HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = const [
    HotelsScreen(),
    HotelsScreen(),
    MyTrips(),
    Favourites(),
    Profile()
  ];
  int index = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_online), label: "Booking"),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_travel), label: "My trips"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile")
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        selectedItemColor: color,
      ),
      body: pages[index],
    );
  }
}
