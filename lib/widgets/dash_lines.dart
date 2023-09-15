import 'package:flutter/material.dart';

class DashLines extends StatelessWidget {
  DashLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        int dashCount = (boxWidth / (dashWidth * 2)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children:  List.generate(dashCount, (_) {
            return  const SizedBox(
              width: dashWidth,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black54),
              ),
            );
          }),
        );
      },
    );
  }
}
