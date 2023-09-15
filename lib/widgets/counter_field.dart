import 'package:flutter/material.dart';

class CounterField extends StatefulWidget {
  CounterField({Key? key, required this.width, required this.count})
      : super(key: key);
  double width;
  int count;
  @override
  State<CounterField> createState() => _CounterFieldState();
}

class _CounterFieldState extends State<CounterField> {
  Widget elevMath({required VoidCallback func, required Widget icon}) {
    return ElevatedButton(
        onPressed: func,
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.black38),
            shape: MaterialStatePropertyAll<OutlinedBorder?>(CircleBorder())),
        child: icon);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width * 0.85,
      child: Stack(
        children: [
          TextFormField(
            cursorColor: Colors.black12,
            readOnly: true,
            decoration: InputDecoration(
              suffixIcon: elevMath(
                  func: () {
                    if (widget.count > 0) {
                      setState(() {
                        widget.count--;
                      });
                    }
                  },
                  icon: const Icon(Icons.remove)),
              prefixIcon: elevMath(
                  func: () {
                    if (widget.count < 20) {
                      setState(() {
                        widget.count++;
                      });
                    }
                  },
                  icon: const Icon(Icons.add)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.black26),
              ), // Center the hintText within the TextFormField
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(widget.count.toString(),
                        style: const TextStyle(color: Colors.white)),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
