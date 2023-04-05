import 'package:cinadoc/scanner.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'about.dart';
import 'home.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffe9bd),
      bottomNavigationBar: CurvedNavigationBar(
          // key: navigationKey,
          index: _currentIndex,
          onTap: (index) => setState(() {
                this._currentIndex = index;

                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                } else if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CameraPage()),
                  );
                } else if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TipsPage()),
                  );
                }
              }),
          backgroundColor: const Color.fromARGB(255, 117, 60, 0),
          color: Color(0xFFffe9bd),
          animationDuration: Duration(microseconds: 300),
          items: [
            Icon(
              Icons.home,
              color: Color.fromARGB(255, 117, 60, 0),
            ),
            Icon(
              Icons.camera,
              color: Color.fromARGB(255, 117, 60, 0),
            ),
            Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 117, 60, 0),
            ),
          ]),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tips",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 117, 60, 0),
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const aboutPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/about.png"))),
                          padding: EdgeInsets.all(26),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Rough Bark",
                //       style: TextStyle(
                //           color: const Color.fromARGB(255, 117, 60, 0),
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold),
                //     )
                //   ],
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Rough Bark",
                //       style: TextStyle(
                //           color: const Color.fromARGB(255, 117, 60, 0),
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold),
                //     )
                //   ],
                // ),
                Container(
                  height: 200,
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: 40,
                    color: Color.fromARGB(255, 224, 224, 224),
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          child: Image(
                            image: AssetImage('assets/images/RB.jpeg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            "Rough Bark",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            "Pruning: Remove the infected branches with pruning shears and destroy them. This will help prevent the disease from spreading to other parts of the tree.",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  height: 160,
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: 40,
                    color: Color.fromARGB(255, 224, 224, 224),
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          child: Image(
                            image: AssetImage('assets/images/RB.jpeg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            "Stripe canker",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            "Rough Bark",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
