import 'package:commerce/view/login_screen.dart';
import 'package:commerce/view/screenwed/Productcontroller.dart';
import 'package:commerce/view/welcome.dart';
import 'package:commerce/view/widgets/example.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:commerce/view/widgets/map.dart';
class settingsScreen extends StatefulWidget {
  const settingsScreen({super.key});

  @override
  State<settingsScreen> createState() => _settingsScreenState();
}




class _settingsScreenState extends State<settingsScreen> {
 final _auth=FirebaseAuth.instance;
 late  User signedInUser;
final controlle = Get.find<ProductControlle>();
void getCurrentUser(){
  try{
  final user=_auth.currentUser;
  if(user!=null){signedInUser=user;}}
  catch(e){print(e);}
}
 @override
   void initState(){super.initState();
   getCurrentUser();}



  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,
    body: ListView(padding: EdgeInsets.all(24),
    children: [
      Profilemage(),
      SizedBox(height: 30,),
      Divider(color: Colors.grey,thickness: 5,),
      SizedBox(height: 20,),
      Text("*GENERAL*",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
    SizedBox(height: 35,),
    ouser(),
    
    SizedBox(height: 35,),

    chat(),
      SizedBox(height: 35,),
      Language(),
 SizedBox(height: 35,),

LogOutWidget(context)
    ],)
    
    );
  
  }
  Widget LogOutWidget(BuildContext context){return Material(color: Colors.transparent,
  child:InkWell(onTap: (() {

showDialog(context:context,builder:(BuildContext context) {
    return AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
      ,backgroundColor: Color.fromARGB(255, 58, 58, 58),title: Text(style:TextStyle(color: Color.fromARGB(255, 255, 255, 255)) ,"Once you click OK,You will logOut.."),actions:<Widget> [
   ElevatedButton(style:  ElevatedButton.styleFrom(
           
            elevation: 0,backgroundColor: Color.fromARGB(255, 82, 126, 248),shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)))
   
   
   ,onPressed: (){
   
    Navigator.of(context).pop();}, child: Text("cancle")),
   ElevatedButton(style:  ElevatedButton.styleFrom(
           
            elevation: 0,backgroundColor: Color.fromARGB(255, 82, 126, 248),shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),))
   ,onPressed: (){ FirebaseAuth.instance.signOut().then((value){Navigator.pushAndRemoveUntil(context,
   MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);});Navigator.of(context).pop();
   
   
   }, child:Text("ok"))
  ],);
}) ;




  }),splashColor: Colors.grey,borderRadius: BorderRadius.circular(12),customBorder: StadiumBorder(),
  child: Row(children: [Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(
    shape: BoxShape.circle,color: Colors.black,
  ),
  child: Icon(Icons.logout_outlined,color: Colors.white,)
  ),SizedBox(width: 20,),
   Text("LogOut",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
  ],),
 ) );}

Widget Profilemage(){return Column(
  children: [
    Row(
      children: [Container(height: 100,width: 100,
      decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle,image: 
      DecorationImage(image: AssetImage('assets/images/fc.jpg'),fit: BoxFit.cover)
      ),
      ),SizedBox(width: 15,),
      
      Column(children: [ Text("Email:",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 16, 0, 160)),),
      SizedBox(height: 10,),
       Text(signedInUser.email.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 46, 143, 1)),),
      ],),
      ],
    )
  ],
);

}
 Widget Language(){return Material(color: Colors.transparent,
  child:InkWell(onTap: (){},splashColor: Colors.grey,borderRadius: BorderRadius.circular(12),customBorder: StadiumBorder(),
  child: Row(children: [Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(
    shape: BoxShape.circle,color: Colors.black,
  ),
  child: Icon(Icons.language_outlined,color: Colors.white,)
  ),SizedBox(width: 20,),
   Text("Languages",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
  ],),
 ) );}

 Widget chat(){return Material(color: Colors.transparent,
  child:InkWell(onTap: (() {
    controlle.goTochatPage();
  }),splashColor: Colors.grey,borderRadius: BorderRadius.circular(12),customBorder: StadiumBorder(),
  child: Row(children: [Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(
    shape: BoxShape.circle,color: Colors.black,
  ),
  child: Icon(Icons.message,color: Colors.white,)
  ),SizedBox(width: 20,),
   Text("Contact Us",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
  ],),
 ) );}


 Widget ouser(){return Material(color: Colors.transparent,
  child:InkWell(onTap: (() {
    Get.to(OrdersUser());
  }),splashColor: Colors.grey,borderRadius: BorderRadius.circular(12),customBorder: StadiumBorder(),
  child: Row(children: [Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(
    shape: BoxShape.circle,color: Colors.black,
  ),
  child: Icon(Icons.production_quantity_limits,color: Colors.white,)
  ),SizedBox(width: 20,),
   Text("Your Orders",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
  ],),
 ) );}

/* void but(BuildContext context){ }*/
}
