import 'package:cinadoc/common/theme_helper.dart';
import 'package:cinadoc/home.dart';
import 'package:cinadoc/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "SFPRODISPLAYMEDIUM"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back222.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: RegistarPage(),
        ),
      ),
    );
  }
}

class RegistarPage extends StatefulWidget {
  const RegistarPage({super.key});

  @override
  State<RegistarPage> createState() => _RegistarPageState();
}

class _RegistarPageState extends State<RegistarPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Center(
                child: Text(
                  "Register",
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
                  decoration: ThemeHelper().textInputDecoration(
                    "User Name",
                    "Enter your user name",
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: TextField(
                  decoration: ThemeHelper().textInputDecoration(
                    "Email",
                    "Enter your email",
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: TextField(
                  decoration: ThemeHelper().textInputDecoration(
                    "Phone Number",
                    "Enter your Phone Number",
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: TextField(
                  obscureText: true,
                  decoration: ThemeHelper().textInputDecoration(
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LoginPage()));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 60, left: 30, right: 30),
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 117, 60, 0),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "SIGN UP",
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
      ),
    );
  }
}
