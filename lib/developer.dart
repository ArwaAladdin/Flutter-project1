import 'package:flutter/material.dart';
//import 'package:untitled/homeScreen.dart';
import 'package:untitled/widgets/navBar.dart';

class Developer extends StatelessWidget {
  const Developer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Developer"),
        leading: IconButton(
      onPressed: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => NavBar(),
              ));
      },
      icon:Icon(Icons.arrow_back_ios), 
          ),
      ),
      body: Center(child: Text("Arwa Aladdin Hussin",style: TextStyle(fontSize: 30),)),
    );
  }
}