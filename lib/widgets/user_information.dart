import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Username",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("Gaith_ko"),
          ],
        ),
        const Divider(thickness: 1, color: Colors.black38),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Email",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("gaith@kozali@gmail.com"),
          ],
        ),
        const Divider(thickness: 1, color: Colors.black38),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("phone",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("+963943737379"),
          ],
        ),
        const Divider(thickness: 1, color: Colors.black38),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Date of brith",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("March 27,2002"),
          ],
        ),
        const Divider(thickness: 1, color: Colors.black38),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("Canada"),
          ],
        ),
        const Divider(thickness: 1, color: Colors.black38),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Account",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("Gold"),
          ],
        ),
      ],
    );
  }
}
