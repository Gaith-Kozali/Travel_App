import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/user_information.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  static const String route = "Profile";
  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.black45,
                ))
          ],
          title: const Text(
            "Edit profile",
            style: TextStyle(color: Colors.black),
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
                horizontal: width * 0.06, vertical: height * 0.03)
            .copyWith(top: height * 0.02),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("assets/bedroom.jpg"),
              radius: 80,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Text("Gaith_kozali",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
            const SizedBox(
              height: 2,
            ),
            const Text("Flutter developer",
                style: TextStyle(color: Colors.black45, fontSize: 16)),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              height: height * 0.43,
              child: const UserInformation(),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
              width: width * 0.85,
              child: ElevatedButton(
                onPressed: signOut,
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 18))),
                child: const Text("Sign Out", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
