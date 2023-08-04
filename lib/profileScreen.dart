import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:untitled/loginScreen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                          radius: 50,
                          backgroundColor: Color(0xFF44BCCF),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "${user!.email}",
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                child: TextButton(
                    onPressed: () {},
                    child: const ListTile(
                      title: Text("Edit profile"),
                      leading: Icon(Icons.edit,color: Color(0xffD45248),),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: TextButton(
                    onPressed: () {},
                    child: ListTile(
                      title: Text("Orders"),
                      leading: Icon(Icons.shopping_bag,color: Color(0xffD45248),),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: TextButton(
                    onPressed: () {},
                    child: ListTile(
                      title: Text("Cards"),
                      leading: Icon(Icons.credit_card,color: Color(0xffD45248),),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: TextButton(
                    onPressed: () {},
                    child: ListTile(
                      title: Text("Notifications"),
                      leading: Icon(Icons.notifications,color: Color(0xffD45248),),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: ListTile(
                      title: Text("Log out"),
                      leading: Icon(Icons.logout,color: Color(0xffD45248),),
                      //trailing: Icon(Icons.navigate_next,color: Colors.black,),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
