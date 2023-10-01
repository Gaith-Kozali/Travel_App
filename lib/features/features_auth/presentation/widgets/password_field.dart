import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/design_color.dart';
import '../../domain/entities/client.dart';

class PasswordField extends StatelessWidget {
  PasswordField(
      {Key? key,
      required this.width,
      required this.height,
      required this.save,
      required this.autofill})
      : super(key: key);
  double width;
  double height;
  void Function(String?)? save;
  bool visibility = false;
  late bool autofill;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: width * 0.6, bottom: height * 0.01, top: height * 0.02),
          child: const Text("Password",
              style: TextStyle(fontWeight: FontWeight.w700)),
        ),
        StatefulBuilder(
          builder: (context, setState) => SizedBox(
            width: width * 0.85,
            child: TextFormField(
                obscureText: !visibility,
                cursorColor: Colors.black12,
                decoration: fieldDesign.copyWith(
                  prefixIcon: IconButton(
                    icon: Icon(
                        visibility ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black38),
                    onPressed: () {
                      setState(
                        () {
                          visibility = !visibility;
                        },
                      );
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return "enter the password";
                  } else if (value.length < 8) {
                    return "weak password";
                  }
                },
                onSaved: save,
                autofillHints: autofill ? const [AutofillHints.password] : null,
                onEditingComplete:
                    autofill ? () => TextInput.finishAutofillContext() : null),
          ),
        ),
      ],
    );
  }
}
