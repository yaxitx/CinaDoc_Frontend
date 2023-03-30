import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cinadoc/common/theme_helper2.dart';

import 'home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // theme: ThemeData(fontFamily: "SFPRODISPLAYMEDIUM"),
      // home: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Center(
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 117, 60, 0)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Center(
              child: Text(
                "Enter your details to sign-up",
                style: TextStyle(
                    color: Color.fromARGB(255, 221, 142, 51),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "create an account",
                style: TextStyle(
                    color: Color.fromARGB(255, 221, 142, 51),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: TextField(
                controller: _emailController,
                decoration: ThemeHelper2().textInputDecoration(
                  "Email",
                  "Enter your Email",
                ),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            margin: EdgeInsets.only(top: 10),
            child: Center(
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: ThemeHelper2().textInputDecoration(
                  "Password",
                  "Enter your password",
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 8),
            child: Center(
              child: Text("OR"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            child: Center(
              child: Text("SIGN UP"),
            ),
          ),

          // SizedBox(height: 25.0,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     GestureDetector(
          //       child: FaIcon(
          //         FontAwesomeIcons.facebook, size: 35,

          //       ),
          //       onTap: () {
          //         setState(() {
          //           showDialog(context: context, builder: (BuildContext (context) {
          //             return ThemeHelper().a
          //           }))
          //         });
          //       },
          //       ),
          //     )
          //   ],
          // )

          Container(
            child: GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value) {
            
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomePage()));
              
                }).onError((error, stackTrace){
                  print("Account not found");
                });
              },
              child: Container(
                margin: const EdgeInsets.only(top: 200, left: 30, right: 30),
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 117, 60, 0),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: const Text.rich(TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "Already have an account?",
                  style: TextStyle(
                      color: const Color.fromARGB(
                        255,
                        117,
                        60,
                        0,
                      ),
                      fontWeight: FontWeight.w500)),
              TextSpan(
                  text: " Sign in",
                  style: TextStyle(
                      color: Color.fromARGB(255, 221, 142, 51),
                      fontWeight: FontWeight.w500))
            ])),
          )
        ],
      ),
    );
  }
}
