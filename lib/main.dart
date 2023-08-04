import 'package:flutter/material.dart';
import 'package:untitled/auth.dart';
import 'package:untitled/productScreen.dart';
import 'package:untitled/loginScreen.dart';
import 'package:untitled/registerScreen.dart';
import 'package:untitled/productScreen.dart';
import 'package:untitled/welcomScreen.dart';
import 'package:untitled/widgets/navBar.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomScreen(),
      //home: LoginScreen(),
      //home: RegisterScreen(),
      //home: HomeScreen(),
      //home: HomeeScreen2(),
      //home: HomeScreen3(),
      //home: ShoppingScreen(),
      //home: NavBar(),
      //home: Auth(),
    );
  }
}

