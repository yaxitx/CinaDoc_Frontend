import 'package:cinadoc/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
              image: AssetImage("assets/images/back.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: GetStartPage(),
        ),
      ),
    );
  }
}

class GetStartPage extends StatefulWidget {
  const GetStartPage({super.key});

  @override
  State<GetStartPage> createState() => _GetStartPageState();
}

class _GetStartPageState extends State<GetStartPage> {
  int _pageState = 0;

  double _loginYOffset = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    switch (_pageState) {
      case 0:
        _loginYOffset = windowHeight;

        break;

      case 1:
        _loginYOffset = 270;

        break;

      case 2:
        _loginYOffset = 205;
        break;
    }

    return Stack(
      children: [
        Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 70),
                      child: const Text(
                        "Hi There Welcome to",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    // Text(
                    //   "CinaDoc",
                    //   style: TextStyle(
                    //       fontSize: 40,
                    //       fontWeight: FontWeight.w500,
                    //       color: Colors.white),
                    // )
                    const Text.rich(TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Cina",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      TextSpan(
                          text: "Doc",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 221, 142, 51)))
                    ]))
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 200,
                // margin: EdgeInsets.only(bottom: 50),
                // padding: const EdgeInsets.symmetric(horizontal: 75),
                // padding: EdgeInsets.only(left: 10, bottom: 60, right: 10, top: 40),
                child: Center(
                  child: Image.asset("assets/images/CinaDoc.png"),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const Register()));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 200, left: 30, right: 30),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 117, 60, 0),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "GET STARTED",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   child: Column(
              //     children: [
              //       Container(
              //         margin: const EdgeInsets.only(top: 90),
              //         padding: EdgeInsets.all(13),
              //         child: Text(
              //           "Already have an account? Sign in",
              //           style: TextStyle(color: Colors.white),
              //         ),
              //       )
              //     ],
              //   ),
              // )

              Container(
                margin: EdgeInsets.only(top: 15),
                child: const Text.rich(TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
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

        //page 2
        // Container(
        //   color: Colors.white,
        // )
      ],
    );
  }
}
