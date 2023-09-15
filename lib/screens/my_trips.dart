import 'package:flutter/material.dart';
import 'package:travel_app/screens/add_trip.dart';
import '../widgets/pop_icon.dart';
import '../widgets/switch_trips.dart';
import '../widgets/trip_widget.dart';

class MyTrips extends StatefulWidget {
  const MyTrips({Key? key}) : super(key: key);
  static const String route ="MyTrips";

  @override
  State<MyTrips> createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTrips> with TickerProviderStateMixin {
  late AnimationController ctrl;

  @override
  void initState() {
    super.initState();
    ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    ctrl.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ctrl.forward();
          if (ctrl.isCompleted) {
            ctrl.reset();
             Navigator.pushNamed(context, AddTrip.route);
          }

        },
        tooltip: "Add a trip",
        child: AnimatedIcon(
          icon: AnimatedIcons.add_event,
          progress: ctrl,
        ),
      ),
      appBar: AppBar(
        leading: const PopIcon(),
        title: const Text("My Trips",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black)),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: height * 0.01),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            children: [
              if (index == 0)
                SwitchTrip(
                  width: width,
                  height: height,
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.01),
                child: TripWidget(
                  width: width,
                  height: height,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
