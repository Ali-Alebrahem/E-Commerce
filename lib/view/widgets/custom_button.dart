import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
final String text;
final dynamic onPressed;

CustomButton({this.text='',this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return  CupertinoButton(color: Color.fromARGB(255, 0, 238, 52),padding: EdgeInsets.all(13),onPressed: onPressed,
      child: CustomText(text: text,color: Color.fromARGB(255, 255, 255, 255),alignment: Alignment.center,fontSize: 20,
      ),
    );
  }
}
