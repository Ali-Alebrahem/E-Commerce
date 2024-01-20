import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce/view/mainn.dart';
import 'package:commerce/view/screenwed/Productcontroller.dart';
import 'package:commerce/view/screenwed/Productmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/custom_button.dart';

//import '../../core/view_model/ordercontroller.dart';

class AdminOrder extends StatelessWidget {
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      
   
    appBar: AppBar(title:Text ("Your Orders"),
    elevation: 0,backgroundColor: Colors.black,centerTitle: true,),
   
      body:StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection("orders").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(backgroundColor: Colors.red,),);
          }

          List<DocumentSnapshot> documents = snapshot.data!.docs;

          return  
         
           ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = documents[index];
              String Name = document.get("Name");
               String Address = document.get("Address");
                String TotalPrice = document.get("TotalPrice");
                 String Phone = document.get("Phone");
                 DateTime Time = document.get("time").toDate();
              Map<String, dynamic> productMap = document.get("product");

              List<Widget> productWidgets = [];
              for (var key in productMap.keys) {
                var value = productMap[key];
                productWidgets.add(Text("* $key: $value " ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color:Color.fromARGB(255, 122, 178, 243))));
              }

              return   Row(  mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
    
                 
                /* Container(padding:EdgeInsets.only(left: 30,top: 30),
         child: Text('Dear admin , here you will find cust',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 136, 131, 130)),),),
        SizedBox(height: 10,),*/
              Expanded(child:   Column(
       mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
         
          Row(children: [ SizedBox(width: 30,),
            Text('* Name:${Name}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:  Color.fromARGB(255, 157, 20, 211)),),]),
         SizedBox(height: 10,),
          
           SizedBox(height: 10,),
          Row(children: [ SizedBox(width: 30,),
           Text('* phone:${Phone}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:  Color.fromARGB(255, 157, 20, 211)),),
        
          
          
          
           ]),

            SizedBox(height: 15,),
            
            /* Row(children: [ SizedBox(width: 25,),  Text('***********************************',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 253, 253, 253)),),
             ]),*/
              SizedBox(height: 15,),
          Row(children: [ SizedBox(width: 70,),   Column(
             
            children: productWidgets,),
           ]),
             SizedBox(height: 15,),
               Row(children: [ SizedBox(width: 30,),
           Text(' *Total price:${TotalPrice} \$',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 28, 160, 10)),),
           ]),
           SizedBox(height: 15,),  
           Row(children: [ SizedBox(width: 30,),
           Text('          *Time:${Time}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:  Color.fromARGB(255, 0, 0, 0)),),
        
          
           ]),
            SizedBox(height: 15,),  
           Text('_____________________________________________________________')
           
            ],
                 ),),
                 
              ]   );
      
          
            },
         );} ));
        }
      
  }

