import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';

import '../Theme/theme.dart';
import 'on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotoOnboeadring();
  }

  void gotoOnboeadring() async {
    await Future.delayed(Duration(seconds: 2));
    Get.to(OnBoarding());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        SizedBox(
          height: screenheight * 0.5,
          width: screenwitdh,
          child: Image.asset('assets/Images/Pattern.png'),
        ),
        Container(
          height: screenheight * 0.5,
          width: screenwitdh,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white.withOpacity(0.8),
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.01),
              ],
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: Get.height * 0.25,
            ),
            SizedBox(
              width: Get.width * 0.75,
              height: Get.width * 0.75,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/Images/g1.png'),
                    Image.asset('assets/Images/g2.png'),
                  ],
                ),
              ),
            ),
            Text(
              'Food Runs',
              style: lighttheme.textTheme.titleLarge!
                  .copyWith(color: red, fontSize: 50),
              textAlign: TextAlign.center,
            ),
          ],
        )
      ]),
    );
  }
}
