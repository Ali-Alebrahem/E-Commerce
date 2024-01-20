import 'package:commerce/view/screenwed/Admin/AdminChat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ChatScreen0 extends StatelessWidget {
 // const MyWidget({super.key});
 late  User signedInUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
  
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('chat'),
   ),
   body:GestureDetector(
    onTap: (() {
      Get.to(ChatScreen1());
    }),
    child: Container(  margin: EdgeInsets.only(left: 10,right: 10,top: 5),
      height: 100,
      width: 500,
      decoration: BoxDecoration(
      border: Border.all(color: Colors.black,width: 2),
        color: Color.fromARGB(255, 29, 11, 192),
        borderRadius: BorderRadius.circular(20),
      ),
     child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
    Row(children: [
            SizedBox(width: 30,),
            Text('     From :',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 89, 255, 67)),),
            SizedBox(width: 10,),
          DecoratedBox(decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromARGB(255, 46, 255, 81),width: 3.0))),child:  Text('${signedInUser}',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 82, 231, 62)),)),
         
            SizedBox(width: 20,),
           Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(
    shape: BoxShape.circle,color: Color.fromARGB(255, 18, 221, 18),
  ),
  child: Icon(Icons.message,color: Colors.white,)
  ),
            
             ],)
           ]
   )) )); }
}