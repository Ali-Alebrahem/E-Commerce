import 'dart:ui';

import 'package:commerce/view/screenwed/Admin/AdminChat.dart';
import 'package:commerce/view/screenwed/Admin/AdminOrder.dart';
import 'package:commerce/view/screenwed/Admin/adminchatreq.dart';
import 'package:commerce/view/widgets/chat.dart';
import 'package:commerce/view/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AdminScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(   elevation: 0,backgroundColor: Colors.black,centerTitle: true,
        title: Text("Admin Screen"),),
    //  dear admin , Here you will find customer orders for products and correspondence received from them .
      body:Column(children:[
       Container(padding:EdgeInsets.only(left: 30,top: 30),
         child: Text('Dear admin , here you will find customer orders for products and correspondence received from them .',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 136, 131, 130)),),),
        SizedBox(height: 200,),
         Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(width: 300,height: 70,child: CustomButton(
              onPressed: () {Get.to(AdminOrder());
                // Do something when the first button is pressed
              },
            text:"Orders"
            ),),
            SizedBox(height: 25),
            SizedBox(width: 300,height: 70,child:   CustomButton(
              onPressed: () {Get.to(ChatScreen0());
                // Do something when the second button is pressed
              },
              text:"Chat",
            ),),
          ],
        ),
      ),
  ] ) );

    
  
  }}