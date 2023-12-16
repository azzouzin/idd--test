import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idd8_test/Theme/theme.dart';
import 'package:idd8_test/Views/on_boarding.dart';
import 'package:idd8_test/Views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lighttheme,
      home: const SplashScreen(),
    );
  }
}
