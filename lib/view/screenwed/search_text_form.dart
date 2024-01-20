import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'Productcontroller.dart';

class SearchFormText extends StatelessWidget {
   SearchFormText({super.key});
    final controlle = Get.find<ProductControlle>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControlle>(builder:(_)=>   TextField(
      controller: controlle.searchTextcontroller,
     onChanged: (searchname){controlle.addsearchtolist(searchname);},

    cursorColor: Colors.black,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
       fillColor: Colors.white,
       focusColor: Colors.red,
       prefixIcon:const Icon(Icons.search,color: Color.fromARGB(255, 36, 24, 24),),
       suffixIcon:controlle.searchTextcontroller.text.isNotEmpty? IconButton(onPressed: () {controlle.clearsearch();},icon: Icon(Icons.close,color: Colors.black,),):null,
     
        hintText: "search your looking for",
        hintStyle:const TextStyle(color: Colors.black45,fontSize: 12,fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
         focusedBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
    ),

     ), );
  }
}
 