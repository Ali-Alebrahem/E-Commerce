import 'package:commerce/constant.dart';
import 'package:commerce/view/mainn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
Icon(Icons.shopping_cart_outlined,size: 150,color: Color.fromARGB(255, 165, 18, 18),),
SizedBox(height: 40,),

RichText(text: TextSpan(children: [TextSpan(text: "Your Cart Is Empty",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold))])),
    
    SizedBox(height: 10,),
    Text("add items to get started",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
    SizedBox(height: 50,),
    SizedBox(height: 50,child:
    ElevatedButton(
      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 58, 56, 55)
      ),
      onPressed: (){}, child: Text("Go To Home",style: TextStyle(fontSize: 20,color: Colors.white),)),
    ),
    ],));
  }
}