import 'package:flutter/material.dart';

Color color = Colors.redAccent;

InputDecoration fieldDesign = InputDecoration(
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.black26)),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
);

ThemeData design = ThemeData(
    primaryColor: color,
    colorScheme: ColorScheme.light(
      background: color,
      primary: color,
    ),
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.white, centerTitle: true),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: color,
    ));
