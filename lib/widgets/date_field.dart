import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatefulWidget {
   DateField({Key? key,required this.fly_out, required this.fly_back,required this.width}) : super(key: key);
   DateTime? fly_out;
   DateTime? fly_back;
   double width;
  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  var myFormat = DateFormat('d-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: widget.width * 0.85,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30)),
                ),
                hintText: widget.fly_out == null
                    ? "fly out"
                    : myFormat.format(widget.fly_out!),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30),
                  ),
                ),
              ),
              onTap: () async {
                widget.fly_out = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: Colors.redAccent,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                              primary: Colors.black87),
                        ),
                      ),
                      child: child ?? Container(),
                    );
                  },
                );
                if (widget.fly_out != null) {
                  setState(() {});
                }
              },
              readOnly: true,
            ),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(30),
                  ),
                ),
                hintText: widget.fly_back == null
                    ? "Fly Back"
                    : myFormat.format(widget.fly_back!),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(30),
                  ),
                ),
              ),
              onTap: () async {
                widget.fly_back = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: Colors.redAccent,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                              primary: Colors.black87),
                        ),
                      ),
                      child: child ?? Container(),
                    );
                  },
                );
                if (widget.fly_back != null) {
                  setState(() {});
                }
              },
              readOnly: true,
            ),
          ),
        ],
      ),
    );
  }
}

