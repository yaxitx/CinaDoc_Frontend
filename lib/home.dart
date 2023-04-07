import 'dart:io';

import 'package:cinadoc/about.dart';
import 'package:cinadoc/scanner.dart';
import 'package:cinadoc/common/products.dart';
import 'package:cinadoc/tips.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [];

  late File _image;
  final imagePicker = ImagePicker();
  Future getImage() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    if (image == null) return;

    // final imageTemporary = File(image.path);

    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffe9bd),

      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Color(0xFFffe9bd),
      //   currentIndex: _currentIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //           color: const Color.fromARGB(255, 117, 60, 0),
      //         ),
      //         label: "Home"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.camera,
      //             color: const Color.fromARGB(255, 117, 60, 0)),
      //         label: "Scan"),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.upload,
      //           color: const Color.fromARGB(255, 117, 60, 0),
      //         ),
      //         label: "Upload"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.notifications,
      //             color: const Color.fromARGB(255, 117, 60, 0)),
      //         label: "Alerts"),
      //   ],
      // ),
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
                        "Welcome!",
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
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFfff2d7),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(151, 158, 158, 158),
                              blurRadius: 8.0,
                              spreadRadius: 2.0,
                              offset: Offset(3.0, 3.0)),
                        ]),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: const Color.fromARGB(255, 117, 60, 0),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 117, 60, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: 240,
              height: 240,
              // margin: EdgeInsets.only(bottom: 50),
              // padding: const EdgeInsets.symmetric(horizontal: 75),
              // padding: EdgeInsets.only(left: 10, bottom: 60, right: 10, top: 40),
              child: Center(
                child: Image.asset("assets/images/home_back.png"),
              ),
            ),

            // Container(
            //   child: FloatingActionButton(
            //     onPressed: getImage,
            //     backgroundColor: Colors.blue,
            //     child: Icon(Icons.camera),
            //   ),
            // ),

            // Container(
            //   decoration: BoxDecoration(
            //     color: Color(0xFFfff2d7),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   padding: EdgeInsets.all(12),
            //   child: Row(
            //     children: [
            //       Icon(
            //         Icons.search,
            //         color: const Color.fromARGB(255, 117, 60, 0),
            //       ),
            //       SizedBox(
            //         width: 5,
            //       ),
            //       Text(
            //         "Search",
            //         style: TextStyle(
            //           color: const Color.fromARGB(255, 117, 60, 0),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Expanded(
              child: Container(
                // margin: const EdgeInsets.only(bottom: 75),
                padding: EdgeInsets.all(25),
                color: const Color.fromARGB(255, 117, 60, 0),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cinnamon Products",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              CinnamonProducts(
                                imagePath: "assets/images/products/Powder.jpg",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Cinnamon Powder",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Column(
                            children: [
                              CinnamonProducts(
                                imagePath: "assets/images/products/Tea.jpeg",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Cinnamon Tea",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Column(
                            children: [
                              CinnamonProducts(
                                imagePath: "assets/images/products/Cuts.jpg",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Cinnamon Cuts",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Container(
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.pushReplacement(context,
            //           MaterialPageRoute(builder: (_) => const CameraPage()));
            //     },
            //     child: Container(
            //       padding: EdgeInsets.all(12),
            //       margin: EdgeInsets.symmetric(horizontal: 24),
            //       decoration: BoxDecoration(
            //         color: Colors.black,
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(24),
            //         ),
            //       ),
            //     ),
            //   ),
            // )

            // Expanded(
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(15),
            //     child: Container(
            //       color: const Color.fromARGB(255, 117, 60, 0),
            //       child: Row(
            //         children: [
            //               Column(
            //                 children: [
            //                   CinnamonProducts(),
            //                   Text("Cinnamon Powder")
            //                 ],
            //               )
            //             ],
            //       ),
            //     ),
            //   ),
            // ),

            // Container(
            //   child: FloatingActionButton(
            //     onPressed: getImage,
            //     backgroundColor: Colors.blue,
            //     child: Icon(Icons.camera),
            //   ),
            // )
          ],
        ),
      ),
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
              Icons.tips_and_updates_sharp,
              color: Color.fromARGB(255, 117, 60, 0),
            ),
          ]),
    );
  }
}
