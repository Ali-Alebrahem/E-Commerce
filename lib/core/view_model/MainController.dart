import 'package:commerce/view/cartscreen.dart';
import 'package:commerce/view/favorites.dart';
import 'package:commerce/view/home.dart';
import 'package:commerce/view/settings.dart';
import 'package:commerce/view/widgets/location.dart';
import 'package:commerce/view/widgets/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:commerce/core/helper/main_binding.dart';


class MainController extends GetxController
{

  RxInt  currentIndex =0.obs;
  final tabs=[
    HomeScreen(),

    cartScreen(),

       
    favoritesScreen(),
   MapSample(),
    settingsScreen(),
   
   

  ].obs;
  final title=[
    "E_Commerce",
    "Cart",
    "favorites",
   "location",
    "Settings",
   
    
  ].obs;
  
  }
