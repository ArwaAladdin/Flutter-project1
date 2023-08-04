import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:untitled/homeScreen.dart';
//import 'package:untitled/productScreen.dart';
//import 'package:untitled/profileScreen.dart';
import 'package:untitled/registerScreen.dart';
import 'package:untitled/widgets/backgroundImg.dart';
import 'package:untitled/widgets/navBar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool changepass = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  late String email;
  late String pass;

  var formKey = GlobalKey<FormState>();

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundImg(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    "Welcome back!",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(.2)),
                    child: TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "must not be empty";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(.2)),
                    child: TextFormField(
                      onChanged: (value) {
                        pass = value;
                      },
                      controller: passController,
                      obscureText: changepass,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "must not be empty";
                        } else if (value.length < 8) {
                          return "must be more than 8 char";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.white),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          suffixIcon: IconButton(
                            onPressed: () {
                              changepass = !changepass;
                              setState(() {});
                            },
                            icon: Icon(
                              changepass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          )),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffE96C63),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) ;
                        try {
                          var user = await auth.signInWithEmailAndPassword(
                              email: email, password: pass);
                          if (user != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavBar(),
                                ));
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have account ?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()),
                          );
                        },
                        child: const Text(
                          "register",
                          style: TextStyle(
                            color: Color(0xff44BCCF),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
        ),
      ),
    ]);
  }
}
