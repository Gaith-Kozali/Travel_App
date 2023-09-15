import 'package:flutter/material.dart';

class SwitchTrip extends StatefulWidget {
   SwitchTrip({Key? key,required this.height ,required this.width}) : super(key: key);
   double width;
   double height;
  @override
  State<SwitchTrip> createState() => _SwitchTripState();
}

class _SwitchTripState extends State<SwitchTrip> {
  AlignmentGeometry position = Alignment.centerLeft;
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: widget.height * 0.08,
        width: widget.width * 0.9,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.redAccent, Colors.orangeAccent],
          ),
          borderRadius: BorderRadius.circular(widget.height * 0.05),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              alignment: position,
              child: Container(
                  margin:
                  EdgeInsets.symmetric(horizontal: widget.width * 0.01),
                  width: widget.width * 0.4,
                  height: widget.height * 0.07,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(widget.height * 0.045),
                  )),
            ),
            Positioned(
              right: (widget.width * 0.2) - (8 * 3.5),
              top: (widget.height * 0.04) -(8),
              child: GestureDetector(
                child: const Text(
                  "Archive",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                onTap: () {
                  setState(() {
                    position = Alignment.centerRight;
                  });
                },
              ),
            ),
            Positioned(
              left: (widget.width * 0.2) - (8 * 4),
              top: (widget.height * 0.04) -(8),
              child: GestureDetector(
                child: const Text(
                  "Upcoming",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                onTap: () {
                  setState(() {
                    position = Alignment.centerLeft;
                  });
                },
              ),
            ),
          ],
        )) ;
  }
}
