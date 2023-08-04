import 'package:flutter/material.dart';
//import 'package:untitled/homeScreen.dart';
import 'package:untitled/widgets/navBar.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        leading: IconButton(
      onPressed: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => NavBar(),
              ));
      },
      icon:Icon(Icons.arrow_back_ios), 
          ),
      ),
      body: Center(child: Text("this application to buy and sell electronic devices ",style: TextStyle(fontSize: 30),)),
    );
  }
}