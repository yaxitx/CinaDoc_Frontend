import 'dart:async';
import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

import 'home.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  int _currentIndex = 0;

  File? _image;
  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

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
                        "Scanner",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 117, 60, 0),
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.all(26),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _image != null
                ? Image.file(
                    _image!,
                    width: 300,
                    height: 350,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    "https://watchandlearn.scholastic.com/content/dam/classroom-magazines/watchandlearn/videos/animals-and-plants/plants/what-are-plants-/What-Are-Plants.jpg"),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              title: "Pick from Gallery",
              icon: Icons.image_outlined,
              onClick: () => getImage(ImageSource.gallery),
            ),
            CustomButton(
              title: "Pick from Camera",
              icon: Icons.camera,
              onClick: () => getImage(ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 200,
    child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(primary: Color.fromARGB(255, 117, 60, 0)),
        onPressed: onClick,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 20,
            ),
            Text(title),
          ],
        )),
  );
}
