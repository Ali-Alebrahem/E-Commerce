import 'package:commerce/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 70,left: 30,right: 25),
     child: Row(children: [
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text("Total",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.grey ),),
           Text("\$680",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.black,height: 1.5),),
        ],
       ),
       
          SizedBox(width: 30,),
       Expanded(child:
          SizedBox(height: 60,child:
           ElevatedButton(style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Color.fromARGB(255, 27, 31, 255),shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
           )),
           onPressed: (){}, 
           
           child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ Text("Check Out",style: TextStyle(fontSize: 20),),
           SizedBox(width: 10,),
           Icon(Icons.shopping_cart)
           ]),
      ), ),) ],)

    );
  }
}