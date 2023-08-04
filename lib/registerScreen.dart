import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:untitled/loginScreen.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:untitled/productScreen.dart';
import 'package:untitled/widgets/backgroundImg.dart';
import 'package:untitled/widgets/navBar.dart';

//import 'homeScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool changepass = true;
  bool changeconpass = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController conPassController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late String email;
  late String pass;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImg(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.grey.withOpacity(.5),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.2)),
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
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.2)),
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
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
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
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.2)),
                            child: TextFormField(
                              controller: conPassController,
                              obscureText: changepass,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "must not be empty";
                                }
                                if (passController.text !=
                                    conPassController.text) {
                                  return "password do not match";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      changeconpass = !changeconpass;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      changeconpass
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                  )),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xffE96C63),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: MaterialButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  try {
                                      await auth.createUserWithEmailAndPassword(
                                          email: email, password: pass);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavBar(),
                                      ));
                                } catch (e) {
                                  print(e);
                                }
                                }
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have account ?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          "login",
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
              ),
            ),
          ),
        )
      ],
    );
  }
}
