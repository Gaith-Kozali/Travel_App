import 'package:flutter/material.dart';

class PopIcon extends StatelessWidget {
  const PopIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black38,
                  ),
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(Icons.arrow_back, color: Colors.black54)),
          onTap: () =>
              Navigator.pop(context)
      ),
    );
  }
}
