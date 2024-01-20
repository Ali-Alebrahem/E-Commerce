import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce/view/screenwed/Productmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'Productcontroller.dart';

class DetailsPage extends StatelessWidget {
  //const DetailsPage (Product product, {super.key});
   final Product product;
 final controlle=Get.find<ProductControlle>();
  DetailsPage(this.product);
 
 dynamic getdetail()async{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentSnapshot detail=await _firestore.collection('products').doc().get();
  dynamic details= detail.get('detail');
return details;
  }
  @override
  Widget build(BuildContext context) {
  
  return  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text('Details'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
           
            Container(
                width:370,
                height:290,
              
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight:Radius.circular(50) ),
                  border: Border.all(color: Colors.black),color: Colors.white
                ),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 50),
           Padding(padding:EdgeInsets.only(left: 15),child: Row(children:[   Align(alignment: Alignment.centerLeft
                        ,child: Text("Name  :",style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 0, 17, 255)),),),
 SizedBox(width: 20),
                        Text(product.rate,style: TextStyle(fontSize: 30,color: Colors.black),),]),),
                          SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Container(
                    
                    width:
                       350, // تعديل القيمة هنا
                    height:200,
                      // تعديل القيمة هنا
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    child:
                       Text(getdetail()
                      ,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold, )  , textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 10),
           Positioned(
                  
              left: 20,
              right: 20,child: Row(children:[
                  IconButton(
                    iconSize:
                        MediaQuery.of(context).size.width * 0.1, // تعديل القيمة هنا
                    icon: Icon(Icons.favorite_outline),
                    onPressed: () {},
                  ),
                  SizedBox(width: 20,),

                   ElevatedButton(style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Color.fromARGB(255, 27, 31, 255),shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
           )),
           onPressed: (){ {controlle.addCart(product); 
            
          }}, 
           
       child: Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ Text("Add Cart",style: TextStyle(fontSize: 20),),
           SizedBox(width: 10,),
           Icon(Icons.shopping_cart)
           ]),
      ), 
       SizedBox(width: 30,),
Text("Price :",style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 0, 81, 255)),),
              
             SizedBox(width: 10,),
              Text(product.price.toString(),style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 94, 255, 54),fontWeight:FontWeight.bold, ),),  ]   )
              )
                     ],
          ),
      ]  ),
   ) );
    
  
}}