import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {

  final String text;
  final String imageName; final dynamic onPress;

  CustomButtonSocial({this.text='',this.imageName='',this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),color:Color.fromARGB(118, 158, 158, 158)/*.fromARGB(161, 110, 110, 233)*/),
         child: CupertinoButton(
      onPressed:onPress,
      child: Row(children: [
        Image.asset(imageName),
        SizedBox(width: 60,),
        CustomText(text:text,color: Colors.black,),
      ],
    ),
    ),
    );
  }
}
