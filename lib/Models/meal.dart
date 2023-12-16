// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Meal {
  final String image;
  final double price;
  final String title;
  final String smallDesc;

  Meal(
      {required this.image,
      required this.price,
      required this.title,
      required this.smallDesc});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'price': price,
      'title': title,
      'smallDesc': smallDesc,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      image: map['image'] as String,
      price: map['price'] as double,
      title: map['title'] as String,
      smallDesc: map['small_desc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) =>
      Meal.fromMap(json.decode(source) as Map<String, dynamic>);
}
