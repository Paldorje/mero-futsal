import 'package:flutter/cupertino.dart';

class CartModel {
  // String img;
  String name;
  // String location;
  int price;
  int items;
  Color color;
  int size;


  CartModel({
    required this.name,
    // required this.location,
    required this.price,
    required this.items,
    // required this.img,
    required this.color,
    required this.size,
  });
}
