import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../view/favorites.dart';

import '../../view/cartscreen.dart';


class HomeViewModel extends GetxController{


int _navigatorValue=0;
get navigatorValue=>_navigatorValue;
 
void changeSelectedValue(int selectedValue){
_navigatorValue=selectedValue;

update();

}

}