import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce/view/mainn.dart';
import 'package:commerce/view/screenwed/Productmodel.dart';
import 'package:commerce/view/widgets/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:commerce/view/screenwed/Productcontroller.dart';
import '../screenwed/payment.dart';
class CheckOut extends StatefulWidget {
  // CardItems({super.key});
 @override
  State< CheckOut> createState() => _CheckOutState();


}




class  _CheckOutState extends State<CheckOut> {
   final _firestore=FirebaseFirestore.instance;
  final TextEditingController phoneController=TextEditingController();
  final TextEditingController NameController=TextEditingController();
   final TextEditingController addressController=TextEditingController();


  int radioContinerIndex=1;
bool changecolors=false;
final controlle=Get.find<ProductControlle>();
final controller=Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
   // backgroundColor: Color.fromARGB(255, 178, 183, 255),
    appBar: AppBar(title:Text ("Payment"),
    elevation: 0,backgroundColor: Colors.black,centerTitle: true,),
    body: SingleChildScrollView(child: Padding(padding: EdgeInsets.all(15),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

      Text("Shipping To",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),
      
      ),
      SizedBox(height: 70,),
      Column(children: [
         buildRadio(
          ss: Container(),
          cx: Container(),
          name: "*You can visit the store at any time" ,
         
          addres: "To help you*",
          icon: Container(),
          phone: " we are always available",
        title: "Receipt From the Store",
        bz: Container(),
        value: 1,
        color: changecolors?Colors.white:Colors.grey.shade300,
       
        onChanged: (int ? value){setState(() {
          radioContinerIndex=value!;
          changecolors=!changecolors;
        });}
      ),


      /*_________________________________________________________________*/
      SizedBox(height: 30,),
     Obx(()=>  buildRadio(
      ss:  Text("🇸🇾 +963",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
      cx:  InkWell(onTap: (() {
          Get.defaultDialog(title: "Enter Your Name",titleStyle:TextStyle(fontSize: 16,color: Colors.black,
          fontWeight: FontWeight.bold),backgroundColor: Colors.white,radius: 10,textCancel: "Cancel",
          confirmTextColor: Colors.black,textConfirm: " Save ",cancelTextColor: Colors.black,
          onConfirm: (() {
            Get.back();
         controller.Name.value=NameController.text;
         
          }
          
          ),
          buttonColor: Colors.blue,
          content: Padding(padding: EdgeInsets.all(15),child:  TextField(
    controller: NameController,
              
maxLength: 50,
onSubmitted: (value) {
  NameController.text=value;
},
    cursorColor: Colors.black,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
       fillColor: Color.fromARGB(255, 206, 196, 250),
       
       focusColor: Colors.red,
       prefixIcon:const Icon(Icons.input,color: Color.fromARGB(255, 36, 24, 24),),
      // suffixIcon:controlle.searchTextcontroller.text.isNotEmpty? IconButton(onPressed: () {controlle.clearsearch();},icon: Icon(Icons.close,color: Colors.black,),):null,
     
        hintText: "Enter Your Name",
        hintStyle:const TextStyle(color: Colors.black45,fontSize: 14,fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
         focusedBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
    ),

     ),)
           );
          
        }),child:Icon(Icons.input,size: 20,color: Colors.red,),),
      bz: InkWell(onTap: (() {
          Get.defaultDialog(title: "Enter Your Address",titleStyle:TextStyle(fontSize: 16,color: Colors.black,
          fontWeight: FontWeight.bold),backgroundColor: Colors.white,radius: 10,textCancel: "Cancel",
          confirmTextColor: Colors.black,textConfirm: " Save ",cancelTextColor: Colors.black,
          onConfirm: (() {
            Get.back();
         controller.address.value=addressController.text;
         
          }
          
          ),
          buttonColor: Colors.blue,
          content: Padding(padding: EdgeInsets.all(15),child:  TextField(
    controller: addressController,
              
maxLength: 50,
onSubmitted: (value) {
  addressController.text=value;
},
    cursorColor: Colors.black,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
       fillColor: Color.fromARGB(255, 206, 196, 250),
       
       focusColor: Colors.red,
       prefixIcon:const Icon(Icons.input,color: Color.fromARGB(255, 36, 24, 24),),
      // suffixIcon:controlle.searchTextcontroller.text.isNotEmpty? IconButton(onPressed: () {controlle.clearsearch();},icon: Icon(Icons.close,color: Colors.black,),):null,
     
        hintText: "Enter Your Address",
        hintStyle:const TextStyle(color: Colors.black45,fontSize: 14,fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
         focusedBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
    ),

     ),)
           );
          
        }),child:Icon(Icons.input,size: 20,color: Colors.red,),),
      /*_______________________________________________________________________________________________*/
        addres:"Your Adrees: ${controller.address.value}",
        name:"Your Name :${ controller.Name.value}",
        phone: controller.phoneNumber.value,
        title: "Free Delivery",
        value: 2,
        color: changecolors?Colors.grey.shade300:Colors.white,
        icon:InkWell(onTap: (() {
          Get.defaultDialog(title: "Enter Your Full Number",titleStyle:TextStyle(fontSize: 16,color: Colors.black,
          fontWeight: FontWeight.bold),backgroundColor: Colors.white,radius: 10,textCancel: "Cancel",
          confirmTextColor: Colors.black,textConfirm: " Save ",cancelTextColor: Colors.black,
          onConfirm: (() {
            Get.back();
         controller.phoneNumber.value=phoneController.text;
         
          }
          
          ),
          buttonColor: Colors.blue,
          content: Padding(padding: EdgeInsets.all(15),child:  TextField(
    controller: phoneController,
              
maxLength: 9,
onSubmitted: (value) {
  phoneController.text=value;
},
    cursorColor: Colors.black,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
       fillColor: Color.fromARGB(255, 206, 196, 250),
       
       focusColor: Colors.red,
       prefixIcon:const Icon(Icons.phone,color: Color.fromARGB(255, 36, 24, 24),),
      // suffixIcon:controlle.searchTextcontroller.text.isNotEmpty? IconButton(onPressed: () {controlle.clearsearch();},icon: Icon(Icons.close,color: Colors.black,),):null,
     
        hintText: "Enter Your Full Number",
        hintStyle:const TextStyle(color: Colors.black45,fontSize: 14,fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
         focusedBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
    ),

     ),)
           );
          
        }),child:Icon(Icons.contact_phone,size: 20,color: Colors.red,),),
        onChanged: (int ? value){setState(() {
          radioContinerIndex=value!;
          changecolors=!changecolors;
        });}
      ),
     ) ],),
     
     
      SizedBox(height: 100,),
     // PaymentMethodWidget(),

  Center(child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       Padding(padding: EdgeInsets.only(left: 30),child:  Text("*Total Price:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 0, 0, 0) ),),),
        Padding(padding: EdgeInsets.only(left: 40),child:  Text(" ${controlle.totalprice().toString() } \$",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 2, 236, 61) ),),),
          SizedBox(height: 30),
          SizedBox(width: 200,height: 70,child: ElevatedButton(style: ElevatedButton.styleFrom(
           
            elevation: 0,backgroundColor: Color.fromARGB(255, 27, 31, 255),shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            
           )),
           onPressed: (){
             showDialog(context:context,builder:(BuildContext context) {
    return AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
      ,backgroundColor: Color.fromARGB(255, 58, 58, 58),title: Text(style:TextStyle(color: Color.fromARGB(255, 255, 255, 255)) ,"Once you click on OK, the order will be sent to us..Are you sure you want to register the order?"),actions:<Widget> [
   ElevatedButton(style:  ElevatedButton.styleFrom(
           
            elevation: 0,backgroundColor: Color.fromARGB(255, 82, 126, 248),shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)))
   
   
   ,onPressed: (){Navigator.of(context).pop();}, child: Text("cancle")),
   ElevatedButton(style:  ElevatedButton.styleFrom(
           
            elevation: 0,backgroundColor: Color.fromARGB(255, 82, 126, 248),shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),))
   ,onPressed: (){ saveproduct(controlle.cart);Navigator.of(context).pop();
    Get.snackbar('The request has been registered successfully', '',backgroundColor: Color.fromARGB(255, 154, 117, 240),colorText: Colors.white,duration: 
    Duration(seconds: 3), snackPosition:SnackPosition.TOP,margin: EdgeInsets.symmetric(horizontal: 20,vertical: 100),padding: 
    EdgeInsets.symmetric(horizontal: 20,vertical: 10),borderRadius: 10,messageText: Text('',textAlign: 
    TextAlign.center,style: TextStyle(fontSize: 6)
    ,)
    );
   
   }, child:Text("ok"))
  ],);
}) ;},
            
           // saveproduct(controlle.cart);},
           
           child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ Text("Buy Now",style: TextStyle(fontSize: 20),),
           SizedBox(width: 10,),
          
           ]),
      ), 
      )  ],
       ),
    //  TotalButton
     ) ]),
    )
    
    ),
        );
}

   Widget buildRadio({ required Color color,required int value,required Function onChanged,
   required String name,required String title,required String phone,required String addres,required Widget icon,
   required bz,required cx,required ss,
   }) {
   
   
    return Container(height: 120,width: double.infinity,decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),color: color,boxShadow: [
      BoxShadow(color: Colors.grey.withOpacity(0.2),spreadRadius: 3.0,blurRadius: 5.0,)
      ]
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
    children: [Radio(value:value , groupValue: radioContinerIndex, onChanged:(int?value){
     
   onChanged(value);
    },fillColor: MaterialStateColor.resolveWith((states) => Colors.red), ),SizedBox(width: 10,),
    Padding(padding: EdgeInsets.only(top: 10,),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    
    children: [
  
Text(title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 76, 2, 248)),
      
      ),
      SizedBox(height: 5,),

                                    /*  Name with Icon*/
      Row(
        children: [
FittedBox(fit: BoxFit.contain,child:  Text(name,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),
        ),),
          
            SizedBox(width: 20,),


          SizedBox(child:cx),
        ],),
      
     
        
      SizedBox(height: 5,),

    Row(
        children: [
      
          ss,
          Text(phone,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
          
          ),
           SizedBox(width: 20,),
          SizedBox(child: icon),
        
        ],
      ),
      SizedBox(height: 5,),
    
      
    
                                   /*   ADDREESS WITH ICON*/
Row(
        children: [
          Text(addres,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),
          
          ),
            SizedBox(width: 20,),

                  
          SizedBox(child: bz),
        ],),

    ],),
    )
    ],
    
      ),);
   }

void saveproduct(List<Product> cart){CollectionReference ordersCollection=FirebaseFirestore.instance.collection('orders');
DocumentReference neworderRef= ordersCollection.doc(); var orderData = {};
for(Product product in cart ){/*neworderRef.set({product.rate:'${product.quantite}'},SetOptions(merge: true));*/
 orderData[product.rate] = '${product.quantite}';
  
}

 neworderRef.set({'product': orderData});
neworderRef.set({"TotalPrice":'${controlle. totalprice()}'},SetOptions(merge: true));
neworderRef.set({"Name":'${controller.Name.value}'},SetOptions(merge: true));
neworderRef.set({"Address":'${controller.address.value}'},SetOptions(merge: true));
neworderRef.set({"Phone":'${controller.phoneNumber.value}'},SetOptions(merge: true));
neworderRef.set({"time":FieldValue.serverTimestamp()},SetOptions(merge: true));

}




}

  

  
   
   