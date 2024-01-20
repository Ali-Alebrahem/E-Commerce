import 'package:get/get.dart';

class ProductController extends GetxController{

 var isFavourites=false.obs;

 
@override
void onInit(){
  super.onInit();
 
}
void addFavourites(){
isFavourites.value=!isFavourites.value;}

 

}