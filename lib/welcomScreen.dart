import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:untitled/loginScreen.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:untitled/widgets/backgroundImg.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImg(),
        Scaffold(
          backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(50.0),
            child: Text(
              "Welcome to Electrinic store",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(onPressed: (){
            Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
          }, 
          child:const Text("Choose Your Device Now!",style: TextStyle(color: Colors.white,fontSize: 20,),))
        ],
      ),
    )
  ]);
  }
}
