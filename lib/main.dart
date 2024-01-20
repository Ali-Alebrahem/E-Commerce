import 'package:commerce/core/helper/binding.dart';
import 'package:commerce/view/favorites.dart';
import 'package:commerce/view/home.dart';

import 'package:commerce/view/login_screen.dart';

import 'package:commerce/view/settings.dart';
import 'package:commerce/view/welcome.dart';
import 'package:commerce/view/widgets/chat.dart';
import 'package:commerce/view/widgets/map.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:commerce/view/mainn.dart';
import 'package:commerce/core/helper/main_binding.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding:Binding(),
      home: Scaffold(
        body:WelcomeScreen(),
      ),
    );
  }}
     