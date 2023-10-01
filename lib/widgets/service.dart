import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  Service(
      {Key? key,
      required this.names,
      required this.height,
      required this.width,
      required this.see})
      : super(key: key);
  List<String> names;
  double height;
  double width;
  bool see;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.format_size),
            Text(names[0],
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            SizedBox(
              width: width * 0.05,
            ),
            const Icon(Icons.airline_seat_individual_suite_rounded),
            Text(names[1],
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            SizedBox(
              width: width * 0.05,
            ),
            const Icon(Icons.air_outlined),
            Text(names[2],
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            SizedBox(
              width: width * 0.05,
            ),
            const Icon(Icons.bathtub),
            Text(names[3],
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16))
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Visibility(
            visible: see,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.wifi),
                Text(names[4]),
                SizedBox(
                  width: width * 0.05,
                ),
                const Icon(Icons.tv),
                Text(names[5]),
                SizedBox(
                  width: width * 0.05,
                ),
                const Icon(Icons.iron),
                Text(names[6]),
              ],
            ))
      ]),
    );
  }
}
