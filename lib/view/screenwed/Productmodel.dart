import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product {
  final String rate;
  final String image;
  RxInt  price;
  bool isaddedtocart;
  RxInt quantite;
  final String details;
 

  Product({required this.rate, required this.image, required this.price,required this.isaddedtocart,required this.quantite,required this.details});

}