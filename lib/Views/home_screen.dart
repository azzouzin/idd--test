import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idd8_test/Services/api_services.dart';

import '../Models/meal.dart';
import '../Theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Meal> mealsList = [];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmealList();
  }

  void getmealList() async {
    mealsList = await ApiServices().getMeals();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFF),
      body: SafeArea(
          child: isLoading == true
              ? Center(child: CircularProgressIndicator())
              : Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SizedBox(
                      height: screenheight * 0.3,
                      width: screenwitdh,
                      child: Image.asset(
                        'assets/Images/bg.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: screenheight * 0.3,
                      width: screenwitdh,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0.85),
                            Colors.white.withOpacity(0.75),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Get.height * 0.1,
                        right: Get.width * 0.05,
                        left: Get.width * 0.05,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Meal Menu',
                            style: lighttheme.textTheme.titleLarge!.copyWith(
                                fontSize: 25, fontWeight: FontWeight.w800),
                          ),
                          verticalpadding,
                          SizedBox(
                            width: Get.width * 0.9,
                            height: Get.height * 0.05,
                            child: Center(
                              child: TextField(
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  hintText: 'Search',
                                  fillColor: textfieldclr,
                                  focusColor: textfieldclr,
                                  filled: true,
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide.none),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          verticalpadding,
                          ...mealsList
                              .map((e) => MealCard(
                                    meal: e,
                                  ))
                              .toList(),
                        ],
                      ),
                    )
                  ],
                )),
    );
  }
}

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.meal,
  });
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(10),
          height: Get.height * 0.13,
          width: Get.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                height: Get.height * 0.1,
                width: Get.height * 0.11,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.network(
                    meal.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: red,
                        child: Text(error.toString()),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    meal.title,
                    style: lighttheme.textTheme.titleLarge!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    meal.title,
                    style: lighttheme.textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Text(
                meal.price.toString() + "\$",
                style: lighttheme.textTheme.titleLarge!
                    .copyWith(fontSize: 20, color: red),
              )
            ],
          ),
        ),
      ],
    );
  }
}
