import 'package:commerce/constant.dart';
import 'package:commerce/core/view_model/auth_view_model.dart';
import 'package:commerce/core/view_model/logo.dart';
import 'package:commerce/view/home.dart';
import 'package:commerce/view/widgets/custom_button.dart';
import 'package:commerce/view/widgets/custom_button_social.dart';
import 'package:commerce/view/widgets/custom_text.dart';
import 'package:commerce/view/widgets/custom_text_for_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();


  // LoginScreen({super.key});
  
  

  @override
  Widget build(BuildContext context) {
     return 
     Scaffold(
      /*appBar: AppBar(
        
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 231, 158, 201),
      ),*/
      
      body:Container(
    
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/7.jpg'),fit: BoxFit.cover)),
        child: Padding(
        padding: const EdgeInsets.only(top: 60,right: 20,left: 20),
        
        child: Form(
          
          key:_formkey ,
          child: SingleChildScrollView( padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          
         child:Column(
        children: [
        /*  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Welcome',fontSize: 30,),
              CustomText(text: 'Sign Up',color: primarycolor,fontSize: 18,),


          ],
          ),*/
         logoa(),
          SizedBox(height: 10),
         /* CustomText(
            text: 'Sign in to Continue',
            fontSize: 14,
            color: Colors.grey,
          ),*/
          SizedBox(height: 30,
          ),

         CustomTextFormField(
          y: false,
          x: Icon(Icons.email_outlined),
           text: 'Email',
           hint: 'YourEmail@gmail.com',
           onSave: (value){
            controller.email=value;
           },
          
           validator: (value){
            if(value==null){print("Error");}
           },
            ),
          SizedBox(height: 40,
          ),
      CustomTextFormField(
        y:true,
          x: Icon(Icons.password_rounded),
            text: 'Password',
            hint: '*************',
            onSave: (value){controller.password=value;},
            validator: (value){ if(value==null){print("Error");}},
          ),
          SizedBox(height: 80,
          ),
         /* CustomText(text: 'Forgot Password',fontSize: 17,alignment: Alignment.topRight,color: Color.fromARGB(255, 10, 131, 6),
          ),
          SizedBox(height: 20,
          ),*/
          
       SizedBox(width:250,height:50,child:  CustomButton(onPressed: () {
    
            _formkey.currentState!.save();
           if(_formkey.currentState!.validate()){
            
            controller.signInWithEmailAndPassword();}
           
          },
            text: "Sign In",
          ),),
        


          SizedBox(height:20 ,),

       CustomText(text: "__ OR __",alignment: Alignment.center,),
           SizedBox(height:30 ,),
           CustomButtonSocial(
            text: 'Sign In With FaceBook',
            imageName: 'assets/images/face4.jpg',
          ),
 SizedBox(height:20 ,),
             CustomButtonSocial(
            text: 'Sign In With Google',
            onPress: (){
            controller.googleSignInMethod();

            },
            imageName: 'assets/images/Goog2.png',
          ),

        ],
      ),
      ),
      ) ),  ), );
    
  }
}
 // }
//}