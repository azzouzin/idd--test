import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idd8_test/Theme/theme.dart';
import 'package:onboarding/onboarding.dart';

import 'home_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBoarding> {
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Stack(alignment: Alignment.bottomCenter, children: [
              SizedBox(
                height: screenheight * 0.1,
                width: screenwitdh,
                child: Image.asset('assets/Images/Pattern2.png'),
              ),
              Container(
                height: screenheight * 0.1,
                width: screenwitdh,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white.withOpacity(0.75),
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.05),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset('assets/Images/Illustration1.png'),
                ),
                Text(
                  'Good Food at a\n cheap price',
                  style: lighttheme.textTheme.titleLarge!,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'You can eat at expensive\n restaurants with\n affordable price',
                  style: lighttheme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
                      style: pageInfoStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Stack(alignment: Alignment.bottomCenter, children: [
              SizedBox(
                height: screenheight * 0.1,
                width: screenwitdh,
                child: Image.asset('assets/Images/Pattern2.png'),
              ),
              Container(
                height: screenheight * 0.1,
                width: screenwitdh,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white.withOpacity(0.75),
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset('assets/Images/3.png'),
                ),
                Text(
                  'Select the \nFavorities Menu',
                  style: lighttheme.textTheme.titleLarge!,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Now eat well, don\'t leave the house,You can \nchoose your favorite food only with \none click',
                  style: lighttheme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();

    index = 0;
  }

  Material _nextButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            if (index == 1) {
              Get.to(HomeScreen());
            } else {}
            setState(() {
              index = 1;
            });
            setIndex(1);
          }
        },
        child: Container(
          width: 157,
          height: 57,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: red,
          ),
          child: Center(
            child: Text(
              'Next',
              style: lighttheme.textTheme.labelMedium,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _nextButton(setIndex: setIndex),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: index == 0 ? red : greybg,
                            shape: BoxShape.circle),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: index != 0 ? red : greybg,
                            shape: BoxShape.circle),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
