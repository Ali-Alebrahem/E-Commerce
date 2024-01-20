import 'dart:ffi';

import 'package:commerce/constant.dart';
import 'package:commerce/core/view_model/MainController.dart';

import 'package:commerce/view/favorites.dart';
import 'package:commerce/view/screenwed/Productcontroller.dart';
import 'package:commerce/view/settings.dart';
import 'package:commerce/view/widgets/example.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'cartscreen.dart';
import 'home.dart';
final controlle = Get.find<ProductControlle>();
class mainn extends StatefulWidget{
  @override
  _mainn createState()=>_mainn();}


class _mainn extends State<mainn> {

  
 //  mainn({super.key});
  final controller=Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Obx((){return Scaffold(
        appBar:AppBar(
          leading:Container(),
          
       /*   actions:[
            IconButton(onPressed: (){controlle.goTochatPage();}, icon: Icon(Icons.mark_unread_chat_alt_outlined),
            ),
          ],*/
          backgroundColor:primarycolor,
         
        
        
        title:Text(controller.title[controller.currentIndex.value]),
        centerTitle:true,
        ),
      
       
        /*bottomNavigationBar: BottomNavigationBar(
         
          currentIndex:controller.currentIndex.value,
          type:BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey,
          
          items:[*/
         bottomNavigationBar: Container(
        
   decoration: BoxDecoration(
    
    borderRadius:BorderRadius.only( topRight: Radius.circular(30),
    topLeft: Radius.circular(30)), 
    boxShadow: [
       BoxShadow(color: Colors.red, spreadRadius: 0, blurRadius: 10), ], ),
        child: ClipRRect( borderRadius: BorderRadius.only( topLeft: Radius.circular(30.0), 
         topRight: Radius.circular(30.0), ),
         
          child: BottomNavigationBar(
           fixedColor: Colors.blue,
         
           
             currentIndex:controller.currentIndex.value,

             items: <BottomNavigationBarItem>[

          
           BottomNavigationBarItem(
           
            
            activeIcon: Icon(Icons.home,color: Color.fromARGB(255, 17, 0, 255),size: 40),
            icon: Icon(Icons.home,color:  Colors.black),
            label: 'Home'
            
            ),
             BottomNavigationBarItem(
            activeIcon: Icon(Icons.shopping_cart,color: Color.fromARGB(255, 57, 54, 244),size: 40),
            icon: Icon(Icons.shopping_cart,color: Colors.black,),
            label: 'Shop',
            ),
            

             BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite,color: Color.fromARGB(255, 57, 54, 244),size: 40),
            icon: Icon(Icons.favorite,color: Colors.black,),
            label: 'favorites',

            ),
           BottomNavigationBarItem(
            activeIcon: Icon(Icons.location_on,color:  Color.fromARGB(255, 57, 54, 244),size: 40),
            icon: Icon(Icons.location_on,color: Colors.black,),
            label: 'Location',),
            
             BottomNavigationBarItem(
            activeIcon: Icon(Icons.settings,color:  Color.fromARGB(255, 57, 54, 244),size: 40),
            icon: Icon(Icons.settings,color: Colors.black,),
            label: 'Settings',
            
          
            ),
            
            
          ],
          
          onTap: (index){
           controller.currentIndex.value=index;

          },
               ),),),
        
        body: IndexedStack(
          index: controller.currentIndex.value,
          children:controller.tabs.value ,
        ),
             //))   );
            );  }

    ),
       );
  }
  
}