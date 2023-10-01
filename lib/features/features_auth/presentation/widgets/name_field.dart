import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  NameField(
      {Key? key,
      required this.lastNameSave,
      required this.firstNameSave,
      required this.width})
      : super(key: key);
  double width;
  Function(String?)? firstNameSave;
  Function(String?)? lastNameSave;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.85,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                cursorColor: Colors.black12,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26),
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(30)),
                  ),
                  hintText: "First name",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "";
                  }
                },
                onSaved: firstNameSave),
          ),
          Expanded(
            child: TextFormField(
                cursorColor: Colors.black12,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26),
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(30),
                    ),
                  ),
                  hintText: "last name",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26),
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(30),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "";
                  }
                },
                onSaved: lastNameSave),
          ),
        ],
      ),
    );
  }
}
