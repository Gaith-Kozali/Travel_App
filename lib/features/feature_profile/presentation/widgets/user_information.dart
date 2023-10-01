import 'package:flutter/material.dart';

import '../../../features_auth/domain/entities/client.dart';

class UserInformation extends StatelessWidget {
  Client client;
  UserInformation({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Username",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("${client.firstName!} ${client.lastName!}"),
          ],
        ),
        const Divider(thickness: 1, color: Colors.black38),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Email",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text(client.email!),
          ],
        ),
        const Divider(thickness: 1, color: Colors.black38),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("phone",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text(client.phone!),
          ],
        ),
        const Divider(thickness: 1, color: Colors.black38),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Date of brith",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text(client.date!),
          ],
        ),
        const Divider(thickness: 1, color: Colors.black38),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("address"),
          ],
        ),
      ],
    );
  }
}
