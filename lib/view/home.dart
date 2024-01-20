import 'package:commerce/constant.dart';

import 'package:commerce/view/screenwed/card_items.dart';
import 'package:commerce/view/screenwed/search_text_form.dart';
import 'package:commerce/view/widgets/custom_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:commerce/core/view_model/MainController.dart';
import 'package:commerce/core/helper/main_binding.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      //  backgroundColor:context.theme.backgroundColor ,
        body: Column(
         children: [
          Container(
              width: double.infinity,
              height: 210,
              decoration: BoxDecoration(
               // color: primarycolor,
               image: DecorationImage(image: AssetImage('assets/images/te.jpg'),fit: BoxFit.cover),
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),
                bottomRight: Radius.circular(20)
                ),
              ),
              child: Padding(padding: const EdgeInsets.only(left:20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:90 ),
                  //    CustomText(fontSize: 25,text: 'Find Your',color: Colors.white),
                     // SizedBox(height:5 ),
                     // CustomText(fontSize: 28,text: 'INSPIRATION',color: Colors.white),
                        SizedBox(height:30 ),
                        SearchFormText(),
                ],
              ),
              ),
          ),
          SizedBox(height:10 ),
          Padding(padding:EdgeInsets.only(left: 20),
         child: CustomText(fontSize: 20,text: '*All Products*',color: Colors.black,),
          ),
          SizedBox(height: 30,),
          CardItems(),
          
         ], 
        ),
      ),
      );
  }
}