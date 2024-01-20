import 'package:commerce/core/helper/binding.dart';



import 'package:commerce/core/view_model/products_controller.dart';
import 'package:commerce/view/screenwed/payment.dart';
import 'package:commerce/view/screenwed/settingcontroller.dart';
import 'package:get/get.dart';
import 'package:commerce/core/view_model/MainController.dart';

import '../../view/screenwed/Productcontroller.dart';

class MainBininding extends Bindings{
  @override
  void dependencies() {
   Get.put(MainController());
    Get.put(ProductController());
     Get.put(ProductControlle());
    Get.put(PaymentController(),permanent: true);
    
   Get.put(settingcontroller());
  
  }



}