import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:untitled/homeScreen.dart';
// import 'package:untitled/productScreen.dart';
import 'package:untitled/loginScreen.dart';
import 'package:untitled/widgets/navBar.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const NavBar();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
