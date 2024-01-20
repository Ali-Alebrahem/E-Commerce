
//import 'dart:html';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
 final dynamic onSave;
 final dynamic validator;
 final Icon x;
 final bool y;
  CustomTextFormField({this.text='',this.hint='',required this.onSave,required this.validator,required this.x,required this.y});
  @override
  Widget build(BuildContext context) {
  return Container(
    child:  Column(
      children: [
      //  CustomText(text: text,fontSize: 25,color: Colors.white,
      //  ),
        TextFormField(
        obscureText: y,
          decoration:InputDecoration(floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 30),
         label: CustomText(text: text,color: Colors.black,fontSize: 22,),
          suffixIcon:x, /*Icon(Icons.email_outlined),*/
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          hintText: hint,
          ),
        // style: TextStyle(color: Colors.white),
         
          onSaved: onSave ,
         validator: validator,
        /*  decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color:Colors.grey.shade600,
            ),fillColor: Colors.white,
          ),*/
        )
      ],),
  );
  }
}
