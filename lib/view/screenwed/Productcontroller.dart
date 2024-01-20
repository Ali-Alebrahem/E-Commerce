import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce/view/widgets/chat.dart';
import 'package:commerce/view/widgets/checkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'Productmodel.dart';
import 'details.dart';

class ProductControlle extends GetxController {
 RxInt y=1.obs;

   var products;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   Rx<bool> show=true.obs;
   RxList<Product>  cartItems = <Product>[].obs;
   RxList<Product>  cart = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  TextEditingController searchTextcontroller=TextEditingController();
 RxInt total=0.obs;
  @override
  void onInit(){
  super.onInit();}

   RxInt totalprice(){
   RxInt total=0.obs;
   for(int i=0;i<cart.length;i++){total+=cart[i].price.toInt();}
   return total;
  }
  

  void addToCart(Product product) {
    
    cartItems.add(product);
    product.isaddedtocart=true;
    show.value=false;
   
    update();
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    product.isaddedtocart=false;
    update();
    
  }

void addsearchtolist (String searchname){
 
  filteredProducts.value=products.where((search) {return search.price.toString().contains(searchname)||search.rate.contains(searchname);} ) .toList();
  update();

}
void clearsearch(){
  searchTextcontroller.clear();
  addsearchtolist('');
}
void increment(Product index ){
 /* RxInt x= cart[index].price;
  RxInt y=cart[index].quantite;*/
  
   RxInt x= index.price;
  RxInt y=index.quantite;
 
   y= y++;
    x.value=x.value+100;
 
  //return x;
   //    product.price.value*=2;// زيادة الرقم بواحد
  }
 

  void decrement(Product index) {
    RxInt z=2.obs;
   RxInt x= index.price;
  RxInt y=index.quantite;
  if(y>1){
   y= y--;
  x.value=(x-100).toInt();}
 // product.price.value-= product.price.value;
// نقصان الرقم بواحد
  }
   void addCart(Product product) {
    if(cart.contains(product)){

    Get.snackbar('sorryوthis item is already added to cart','',backgroundColor: Color.fromARGB(255, 243, 107, 107),colorText: Colors.white,duration: 
    Duration(seconds: 2),
    snackPosition:SnackPosition.BOTTOM,margin: EdgeInsets.symmetric(horizontal: 20,vertical: 100),padding: 
    EdgeInsets.symmetric(horizontal: 20,vertical: 10),borderRadius: 10,messageText: Text('',textAlign: 
    TextAlign.center,style: TextStyle(fontSize: 10)
    ,)
        );}
    else{
    cart.add(product);
    Get.snackbar('add successfully', '',backgroundColor: Color.fromARGB(255, 154, 117, 240),colorText:Colors.white,duration: 
    Duration(seconds: 2), snackPosition:SnackPosition.BOTTOM,margin: EdgeInsets.symmetric(horizontal: 20,vertical: 100),padding: 
    EdgeInsets.symmetric(horizontal: 20,vertical: 10),borderRadius: 10,messageText: Text('',textAlign: 
    TextAlign.center,style: TextStyle(fontSize: 6)
    ,)
    );
   // product.isaddedtocart=true;
   
    update();
  }}

  void removeCart(BuildContext context,Product product) {

    showDialog(context:context,builder:(BuildContext context) {
    return AlertDialog(title: Text("Are you sure to delete the item?"),actions:<Widget> [
    TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("cancle")),
    TextButton(onPressed: (){cart.remove(product);Navigator.of(context).pop();}, child:Text("ok"))
  ],);
}) ;
   // cart.remove(product);
   // product.isaddedtocart=false;
    
    update();
 
  }
  

  
   void goToDetailsPage(Product product) {
    Get.to(DetailsPage(product));
  }
   void goTochatPage() {
    Get.to(ChatScreen());
 

   }
   void goTocheckout() {
    Get.to(CheckOut());
 
   }
    

 /* void placeOrder() async {
    var orderData = {};
    for (Product product in cart) {
     orderData[product.rate] = '${product.quantite}';
   
    }
    orderData['sender'] = 'ali';
    await _firestore.collection('fadi').doc().set({'product': orderData});
 
  }*/

  
  }


 



