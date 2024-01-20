import 'package:commerce/view/screenwed/Productcontroller.dart';
import 'package:commerce/view/screenwed/Productmodel.dart';

import 'package:commerce/view/widgets/EmptyCart.dart';

import 'package:commerce/view/widgets/cart_total.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class cartScreen extends StatefulWidget{
  @override
  _cartScreen createState()=>_cartScreen();}

class _cartScreen extends State<cartScreen> {
 // cartScreen({super.key});
//final controller=Get.find<CartController>();
final controller=Get.find<ProductControlle>();

  @override
  Widget build(BuildContext context) {
   
   
  return Obx(() {
     if(controller.cart.length==0){return Center(child:Column(children:

      [SizedBox(height: 65,),Lottie.asset('assets/lottie/caart.json',),
      Text('Your Cart Is Empty ...',style: TextStyle(fontSize: 23,color: Colors.grey),)]));
     
     }
    
    
     else{
    
    return SafeArea(child:
  
   
   Scaffold(
      body:SingleChildScrollView(child: Column(children: [
  SizedBox(height: 500,
  child: ListView.separated(
    itemBuilder:(context, index) {
   final product = controller.cart[index];
    // CartProductCard();
    return  Container(

      margin: EdgeInsets.only(left: 10,right: 10,top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
      border: Border.all(color: Colors.black,width: 2),
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
     child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Container(
          height: 120,width: 100,margin: EdgeInsets.only(left: 15),decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image:AssetImage(product.image),fit: BoxFit.cover ,)
          ),
          
          ),
          SizedBox(width: 20,),
            Expanded(flex: 15,child:  Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("flutter developer code",style: TextStyle(
              overflow: TextOverflow.ellipsis
              ,color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Obx(()=> Text('${controller.cart[index].price.toString()}',style: TextStyle(
              overflow: TextOverflow.ellipsis
              ,color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
             ) ],
          )
          
       ) ,
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
       children:[
         Row(children: [  IconButton(onPressed: (){ controller.decrement(product);}, icon: Icon(Icons.remove_circle,color: Color.fromARGB(255, 87, 3, 243),)),
     Obx(()=> Text('${controller.cart[index].quantite}',style: TextStyle(
              overflow: TextOverflow.ellipsis
              ,color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),),
         IconButton(onPressed: (){ controller.increment(product);}, icon: Icon(Icons.add_circle,color: Color.fromARGB(255, 87, 3, 243),)),
       ],),

     IconButton(onPressed: (){controller.removeCart(context,product); setState(() {
            
          });}, icon: Icon(Icons.delete,color: Color.fromARGB(255, 255, 41, 25),)),
          ],
          
      ),
        ],
        )   )  ;
    } ,
     separatorBuilder: (context, index) =>SizedBox(height: 20,) ,
      itemCount:controller.cart.length),
  ),
     Padding(padding: EdgeInsets.only(bottom: 30),
     child:  // CartTotal(),
      Container(
      padding: EdgeInsets.only(top: 70,left: 30,right: 25),
     child: Row(children: [
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text("Total",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.grey ),),
         Obx(()=>  Text('${controller.totalprice().toString()}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.black,height: 1.5),),
        ) ],
       ),
       
          SizedBox(width: 30,),
       Expanded(child:
          SizedBox(height: 60,child:
           ElevatedButton(style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Color.fromARGB(255, 27, 31, 255),shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
           )),
           onPressed: (){controller.goTocheckout();}, 
           
           child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ Text("Check Out",style: TextStyle(fontSize: 20),),
           SizedBox(width: 10,),
           Icon(Icons.shopping_cart)
           ]),
      ), ),) ],)

    )
     )

      ]),)
    )

    ,);}},);
    
    }
}


