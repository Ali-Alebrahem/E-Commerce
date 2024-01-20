//import 'dart:html';

import 'package:commerce/view/home.dart';

import 'package:commerce/view/mainn.dart';
import 'package:commerce/view/screenwed/Admin/AdminButton.dart';
import 'package:commerce/view/widgets/chat.dart';
import 'package:commerce/view/widgets/checkout.dart';

import 'package:firebase_auth/firebase_auth.dart';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../view/favorites.dart';
import '../../view/cartscreen.dart';
import 'home_view_model.dart';

//import 'package:firebase_auth/firebase_auth.dart';
//import '../../view/widgets/custom_text_for_field.dart';

class AuthViewModel extends GetxController{
late  User signedInUser;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth= FirebaseAuth.instance;
   late String email, password,name;

  get user => null;
   
  
 
  void googleSignInMethod()async{
  

  final GoogleSignInAccount? gooleUser = await _googleSignIn.signIn();
  print(gooleUser);
  GoogleSignInAuthentication googleSignInAuthentication =await gooleUser!.authentication;
  final AuthCredential credential= GoogleAuthProvider.credential(
    idToken: googleSignInAuthentication.idToken,
    accessToken:googleSignInAuthentication.accessToken,
  );
     await _auth.signInWithCredential(credential);
     Get.off(mainn());
  }
  
  void signInWithEmailAndPassword() async{
   
   try{
    if(email=='alialebrahem@gmail.com'){ Get.offAll(AdminScreen());}
else{
    Center(child: CircularProgressIndicator(backgroundColor: Colors.red,),);
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    
     
       Get.offAll(mainn());}
     
  }


   
  on FirebaseAuthException catch(e){
    print(e.message);
    Get.snackbar('Error Login Account', 
    e.message.toString(),
    colorText: Colors.black,
    snackPosition: SnackPosition.BOTTOM);
   }
}
Widget bottomNavigationBar() {
return GetBuilder<HomeViewModel>(
  init: HomeViewModel (),
  builder: (controller) =>BottomNavigationBar(items: [
BottomNavigationBarItem(
 label: 'Explore',
  icon: Image.asset('assets/images/ex1.png',fit: BoxFit.contain,width: 30,height: 30,)
),
BottomNavigationBarItem(
 label: 'Cart',
  icon: Image.asset('assets/images/car.png',fit: BoxFit.contain,width: 30,height: 30,)
),
BottomNavigationBarItem(
 label: 'Account',
  icon: Image.asset('assets/images/add.png',fit: BoxFit.contain,width: 30,height: 30,)
),
],
currentIndex: controller.navigatorValue,
onTap: (index){

controller.changeSelectedValue(index);
//switch(index){case 0:{currentscreen=HomeView();break;}case 1:{currentscreen=CartView();break;}case 2:{currentscreen=ProfileView();break;}}
/*if(index==1){Get.to (CartView());}
else if(index==2){Get.to(ProfileView());}*/

},
selectedItemColor: Colors.green,
backgroundColor: Colors.grey.shade50,
 

),);
  }
 
  
  
  }