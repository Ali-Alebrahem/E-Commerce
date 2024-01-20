 import 'dart:async';
//import 'dart:html';

//import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce/constant.dart';




import 'package:commerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:commerce/core/view_model/products_controller.dart';
import 'package:commerce/core/helper/main_binding.dart';

import 'Productcontroller.dart';
bool isfavorite=false;

class CardItems extends StatefulWidget {
  // CardItems({super.key});
 @override
  _ListViewPageState createState() => _ListViewPageState();


}




class _ListViewPageState extends State<CardItems> {


  final controller=Get.find<ProductController>();
   
 // final controlle = Get.put(ProductControlle());
  
 final controlle=Get.find<ProductControlle>();
 


  @override
  Widget build(BuildContext context) {
  
    return Obx(()=> Expanded(child:

GridView.builder(
 gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 0.8,
        mainAxisSpacing: 9.0,
        crossAxisSpacing: 6.0,
        maxCrossAxisExtent: 200
      ),
  
   
   itemCount: controlle.filteredProducts.isEmpty?controlle.products.length:controlle.filteredProducts.length,  
  itemBuilder: (BuildContext context, int index) {

    // final product = controlle.products[index];
    final product;
    if(controlle.filteredProducts.isEmpty){product = controlle.products[index];}
    else{product = controlle.filteredProducts[index];}
   
    return   Padding(
      padding: EdgeInsets.all(5),
      child:Container(
      
      decoration: BoxDecoration( borderRadius: BorderRadius.circular(15),
       boxShadow: [
    BoxShadow(

color: Colors.grey.withOpacity(0.1),
spreadRadius: 3.0,
blurRadius: 5.0,

    ),
  ],
        border: Border.all(color: Colors.white),
      ),
      child: Column(
       children: [
        // Obx(() =>
     Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
       IconButton(onPressed: (){
          if(product.isaddedtocart){controlle.removeFromCart(product);setState(() {
            
          });}
          else{controlle.addToCart(product); setState(() {
            
          });}
          }
          
      
          ,icon:Icon(Icons.favorite,color: product.isaddedtocart?Colors.red:Colors.blueGrey,
        
          )),
           
             IconButton(onPressed: (){setState(() {controlle.addCart(product); 
            
          });}, icon: Icon(Icons.shopping_cart,color: Color.fromARGB(255, 56, 109, 255),),
          color: Colors.black,)
            
           
          ],
          
        ),//),
        
          Expanded(child:Container(  width: double.infinity,
           height:170 ,
           
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),child:GestureDetector(
                onTap: () => controlle.goToDetailsPage(product),child:
             Image.asset(product.image),
       
          ),),),
          SizedBox(height: 5,),
         // Text('Some text'),
          Padding(padding:EdgeInsets.only(left: 15,right: 15,top: 10),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(product.price.toString(),style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
            Container(
              height:20 ,
              width: 75,
              decoration: BoxDecoration(
                color: primarycolor,
                borderRadius: BorderRadius.circular(10),
              ),
                 child: Padding(padding: EdgeInsets.only(left: 3,right: 2),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  CustomText(text: product.rate,fontSize:16 ,color: Colors.white,),
                  // Icon(Icons.star,size: 13,color: Colors.white,),
                  ],
                 ),
                 ),
              
          
            ),],),),
            SizedBox(height: 5,),
       ],
      ),
     ), );
   } 
   
  
),
      ) 
      );
  }
  
}
 