

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce/view/mainn.dart';
import 'package:commerce/view/screenwed/Productcontroller.dart';
import 'package:commerce/view/screenwed/Productmodel.dart';
import 'package:commerce/view/widgets/custom_text_for_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';


//import '../../core/view_model/ordercontroller.dart';

class OrdersUser extends StatefulWidget {
 
  @override
  State<OrdersUser> createState() => _OrdersUserState();
}

class _OrdersUserState extends State<OrdersUser> {


 RxBool canEdit = true.obs;

 RxBool z=false.obs;
  dynamic TWO_PI = 3.14 * 2;
 final size = 100.0;
    final TextEditingController _editNameController = TextEditingController();
                           
          final TextEditingController _editPhoneController =  TextEditingController();
           final TextEditingController _editAddressController =  TextEditingController();
String _textfield='';
  


   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      
   
    appBar: AppBar(title:Text ("Your Orders"),
    elevation: 0,backgroundColor: Colors.black,centerTitle: true,),
   
      body:Column(children: [Container(child: Lottie.asset('assets/lottie/car.json',width: 300,height: 250,),),
      SizedBox(height: 30,),
      
   Expanded(child:  Container(child:  StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection("orders").orderBy('time').snapshots(),
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

 DateTime currentTime = DateTime.now();
     
      Duration difference = currentTime.difference(Time);
      // إذا كان الفرق بين وقتين أكبر من ساعة واحدة، يمنع التعديل
     
      
      if (difference.inMilliseconds <2000) {
  
        canEdit.value=true;
      
     }  else
   
     {canEdit.value=false;}
    
     
 
                  
            Map<String, dynamic> productMap = document.get("product");

              List<Widget> productWidgets = [];
              for (var key in productMap.keys) {
                var value = productMap[key];
                productWidgets.add(Text("* $key: $value " ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color:Color.fromARGB(255, 122, 178, 243))));
              }

              return    Row(  mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
            
                
               
               Expanded(child:  Column(
       mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
         
          Row(children: [ SizedBox(width: 30,),
          Text('* Name:${Name}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:  Color.fromARGB(255, 157, 20, 211)),)]),
         SizedBox(height: 10,),
          
           SizedBox(height: 10,),
          Row(children: [ SizedBox(width: 30,),
           Text('* phone:${Phone}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:  Color.fromARGB(255, 157, 20, 211)),),]),
          SizedBox(height: 10,),
          Row(children: [ SizedBox(width: 30,),
           Text('* Address:${Address}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:  Color.fromARGB(255, 157, 20, 211)),),]),
        
              SizedBox(height: 15,),
          Row(children: [ SizedBox(width: 70,),   Column(
             
            children: productWidgets,),
           ]),
             SizedBox(height: 15,),
               Row(children: [ SizedBox(width: 30,),
           Text('*Total price:${TotalPrice} \$ ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 28, 160, 10)),),
           ]),
           SizedBox(height: 15,),
            Row(
              children: [

   Padding(
       padding: const EdgeInsets.only(left: 20.0),
       child:  TweenAnimationBuilder<double>(
              tween:canEdit.value? Tween( begin: 0.0,end: 1.0):Tween( begin: 1.0,end: 1.0),
              duration: Duration(seconds: 40),
              builder:(context,value,child){
                     int percentage = (value*100).ceil();
                    
               return   Container(
                  width: size,
                  height: size,
                  child: Stack(
                    children: [
                      ShaderMask(
                        shaderCallback: (rect){
                          return SweepGradient(
                              startAngle: 0.0,
                              endAngle: TWO_PI,
                              stops: [value,value],
                              // 0.0 , 0.5 , 0.5 , 1.0
                              center: Alignment.center,
                              colors: [Colors.blue,Colors.grey.withAlpha(55)]
                          ).createShader(rect);
                        },
                        child: Container(
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: Image.asset("assets/images/ex1.png").image)
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: size-20,
                          height: size-20,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                          ),
                          child: Center(child: Text("${percentage}",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                        ),
                      )
                    ],
                  ),
                 );
              },
            ),
     ),
    
SizedBox(width: 50,),
  Container(
          width: 140,height: 40, decoration: BoxDecoration(
        border: Border.all(color: Colors.black,width: 2) ,
          color:Color.fromARGB(255, 52, 190, 17),
          borderRadius: BorderRadius.circular(20),
        ),
          child: Center(
                child:canEdit.value? CountdownTimer(
                  endTime: DateTime.now().millisecondsSinceEpoch + 7000, // وقت انتهاء المؤقت (1 ساعة)
                  textStyle: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                  onEnd: (){Text("nooooo");
                    // يتم تنفيذ هذه الوظيفة عند انتهاء المؤقت
                  
                  
                  
                  },
                ):Text('noooooo'),
          ),
        ),

           /*    Container(
          width: 140,height: 40, decoration: BoxDecoration(
        border: Border.all(color: Colors.black,width: 2),
          color: Color.fromARGB(255, 247, 119, 208),
          borderRadius: BorderRadius.circular(20),
        ),
          child: Center(
                child: CountdownTimer(
                  endTime: DateTime.now().millisecondsSinceEpoch + 42000, // وقت انتهاء المؤقت (1 ساعة)
                  textStyle: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                  onEnd: () {
                    // يتم تنفيذ هذه الوظيفة عند انتهاء المؤقت
                    print('انتهى المؤقت');
                   
                  },
                ),
          ),
        ),*/
              ],
            ),    
           Text('_____________________________________________________________')
           
            ],
                )),
    Padding(padding: EdgeInsets.only(right: 20),child:   Material(color: Colors.transparent,
  child:InkWell(onTap: (() {
  
  }),splashColor: Colors.grey,borderRadius: BorderRadius.circular(12),customBorder: StadiumBorder(),
  child:Row(children: [ Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(
    shape: BoxShape.circle, color:Colors.grey,
  ),
  child:  IconButton(onPressed:(){


/* DateTime currentTime = DateTime.now();
    
      Duration difference = currentTime.difference(Time);
      // إذا كان الفرق بين وقتين أكبر من ساعة واحدة، يمنع التعديل
      if (difference.inHours >8) {
   
         print("yeussssssssssssssssssssssssssssssssss");
     }
     else{print("nooooooooooooooooooooooooooo");}*/
      


canEdit.value?
 showModalBottomSheet(
        context: context,
      
        builder: (BuildContext context) {
          
          return  Container(height:800,
          decoration: BoxDecoration( border: Border.all(color: Color.fromARGB(255, 0, 0, 0),width: 2), borderRadius: BorderRadius.only(topLeft:Radius.circular(50),topRight:Radius.circular(50),),
          boxShadow: [BoxShadow(color:/* Color.fromARGB(255, 157, 146, 255)*/Color.fromARGB(255, 121, 184, 255),spreadRadius: 0,blurRadius: 0,)],),
            padding: EdgeInsets.all(16.0),
            child:SingleChildScrollView(child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
               SizedBox(height: 20,),
            TextField(style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                 onChanged: (value) {
                    setState(() {
                    TextField!=value;
                    });
                  },
               controller: _editNameController,
                  decoration: InputDecoration(  labelText: '* Edit Your Name',labelStyle: TextStyle(color: Colors.black54)),
                  
                             
                             
                ),
              

               
              //  Text(_textfield),
               SizedBox(height: 30.0),

           
                 TextField(style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                  onChanged: (value) {
                    setState(() {
                    TextField!=value;
                    });
                  },
                  controller: _editPhoneController,
                  decoration: InputDecoration( labelText: '* Edit Your Phone',labelStyle: TextStyle(color: Colors.black54),),
                ),
                
             //   Text(_textfield),
                  SizedBox(height: 30.0),
                  TextField(style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                     onChanged: (value) {
                    setState(() {
                    TextField!=value;
                    });
                  },
              // controller: _editAddressController,
                  decoration: InputDecoration(   labelText: '* Edit Your Address',labelStyle: TextStyle(color: Colors.black54)),
                             
                             
                ),
                
             //   Text(_textfield),
                
                SizedBox(height: 10.0),
               
              
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.delete),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                     
                    ),
                    SizedBox(width: 8.0),
                   IconButton(icon: Icon(Icons.edit),
                      onPressed: () {
                      
                      String editedName = _editNameController.text;
                                String editedPhone = _editPhoneController.text;
                                //  String editAddress = _editAddressController.text;
                                _firestore
                                    .collection('orders')
                                    .doc(document.id)
                                    .update({'Name': editedName, 'Phone': editedPhone,'time':Time});
                                Navigator.pop(context);
                               _editAddressController.clear();
                               _editNameController.clear();
                               _editPhoneController.clear();
                              },
                     
                      
                     
                    ),
                  ],
                ),
              ],
            ),
          ));
   },
   shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(50.0),
      topRight: Radius.circular(50.0),
    ),
  ),
 // isScrollControlled: true,
  backgroundColor: Color.fromARGB(255, 155, 153, 153),
  elevation: 0.0,

 

   ):{};





  },icon:Icon(Icons.edit),color: Color.fromARGB(255, 255, 255, 255),),
    ),]))),
              
            ) ]);

            });})))]));
            
            
            }
           /* Widget x(){
         return Container(
          width: 140,height: 40, decoration: BoxDecoration(
        border: Border.all(color: Colors.black,width: 2),
          color: Color.fromARGB(255, 247, 119, 208),
          borderRadius: BorderRadius.circular(20),
        ),
          child: Center(
                child: CountdownTimer(
                  endTime:canEdit.value? DateTime.now().millisecondsSinceEpoch + 20000:DateTime.now().millisecondsSinceEpoch + 0, // وقت انتهاء المؤقت (1 ساعة)
                  textStyle: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                  onEnd: (){/*z.value=true;*/
                    // يتم تنفيذ هذه الوظيفة عند انتهاء المؤقت
                  
                  
                  
                  },
                ),
          ),
        );
          }*/
          
    

}