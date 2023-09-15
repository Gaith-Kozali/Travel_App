import 'package:flutter/material.dart';

class TransportationType extends StatefulWidget {
  TransportationType(
      {Key? key,
      required this.height,
      required this.width,})
      : super(key: key);

  double width;
  double height;
  @override
  State<TransportationType> createState() => _TransportationTypeState();
}

class _TransportationTypeState extends State<TransportationType> {
  List<bool> transportation = [];
  List<bool> condition = [];
  @override
  void initState(){
    super.initState();
    transportation=[false,false,false];
    condition=[false,false];
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: AnimatedContainer(
                height:  widget.height * 0.1,
                width:  widget.width * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: transportation[0]
                        ? Colors.redAccent
                        : Colors.white),
                duration: const Duration(milliseconds: 250),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.hotel_sharp,
                        color: transportation[0]
                            ? Colors.white
                            : Colors.black),
                    Text(
                      "Hotels",
                      style: TextStyle(
                          color: transportation[0]
                              ? Colors.white
                              : Colors.black),
                    )
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  transportation = [true, false, false];
                });
              },
            ),
            SizedBox(
              width: widget.width * 0.07,
            ),
            GestureDetector(
              child: AnimatedContainer(
                height: widget.height * 0.1,
                width: widget.width * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: transportation[1]
                        ? Colors.redAccent
                        : Colors.white),
                duration: const Duration(milliseconds: 250),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.flight_takeoff,
                        color: transportation[1]
                            ? Colors.white
                            : Colors.black),
                    Text(
                      "Flight",
                      style: TextStyle(
                          color: transportation[1]
                              ? Colors.white
                              : Colors.black),
                    )
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  transportation = [false, true, false];
                });
              },
            ),
            SizedBox(
              width: widget.width * 0.07,
            ),
            GestureDetector(
              child: AnimatedContainer(
                height:  widget.height * 0.1,
                width: widget.width * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: transportation[2]
                        ? Colors.redAccent
                        : Colors.white),
                duration: const Duration(milliseconds: 250),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.directions_bus,
                        color: transportation[2]
                            ? Colors.white
                            : Colors.black),
                    Text(
                      "Bus",
                      style: TextStyle(
                          color: transportation[2]
                              ? Colors.white
                              : Colors.black),
                    )
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  transportation = [false, false, true];
                });
              },
            )
          ],
        ),
        SizedBox(height: widget.height*0.02,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              child: AnimatedContainer(
                height: widget.height * 0.05,
                width: widget.width * 0.4,
                decoration: BoxDecoration(
                    color:
                        condition[0] ? Colors.redAccent : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black45)),
                duration: const Duration(milliseconds: 250),
                child: Center(
                  child: Text("One Way",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: condition[0]
                              ? Colors.white
                              : Colors.black)),
                ),
              ),
              onTap: () {
                setState(() {
                  condition = [true, false];
                });
              },
            ),
            GestureDetector(
              child: AnimatedContainer(
                height: widget.height * 0.05,
                width: widget.width * 0.4,
                decoration: BoxDecoration(
                    color:
                        condition[1] ? Colors.redAccent : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black45)),
                duration: const Duration(milliseconds: 250),
                child: Center(
                  child: Text("Return",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: condition[1]
                              ? Colors.white
                              : Colors.black)),
                ),
              ),
              onTap: () {
                setState(() {
                  condition = [false, true];
                });
              },
            )
          ],
        )
      ],
    );
  }
}
