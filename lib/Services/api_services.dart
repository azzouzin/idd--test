import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/meal.dart';

class ApiServices {
  Future<List<Meal>> getMeals() async {
    List<Meal> mealsList = [];
    final response =
        await http.get(Uri.parse("https://api.npoint.io/df91c46416d973347be9"));

    if (response.statusCode == 200) {
      for (var element in json.decode(response.body)['menu']) {
        mealsList.add(Meal.fromMap(element));
        print(mealsList.length);
      }
    } else {
      print(response.statusCode);
    }
    return mealsList;
  }
}
