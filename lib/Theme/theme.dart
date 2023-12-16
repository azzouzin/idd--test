import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextStyle titleStyle = TextStyle();

final ThemeData lighttheme = ThemeData(
  fontFamily: 'Avenir',
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  buttonTheme: ButtonThemeData(
    buttonColor: red,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'Avenir',
      fontSize: 14,
      color: grey,
      fontWeight: FontWeight.w300,
    ),
    labelMedium: TextStyle(
        fontFamily: 'Avenir',
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600),
    titleLarge: TextStyle(
        fontFamily: 'Avenir',
        fontSize: 22,
        color: black,
        fontWeight: FontWeight.w800),
  ),
);

final black = Color(0xff09051C);
final grey = Color(0xff4B5563);
final greybg = Color(0xffE6E6E6);
final red = Color(0xffFF0000);
final textfieldclr = Color(0xffFFDFDF);

final screenheight = Get.size.height;
final screenwitdh = Get.size.width;

final verticalpadding = SizedBox(height: 20);
