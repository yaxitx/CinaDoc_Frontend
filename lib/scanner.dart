import 'dart:async';
import 'dart:io';
import 'package:cinadoc/tips.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

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
  int _currentIndex = 1;

  File? _image;
  Future<void> getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });

    final url = Uri.parse('http://10.0.2.2:5000/predict');

    // Create a multipart request using the http package
    final request = http.MultipartRequest('POST', url);

    // Add the image file to the request
    // final file =
    //     await http.MultipartFile.fromPath('image', imageTemporary.path);

    final stream = http.ByteStream(imageTemporary.openRead());
    final length = await imageTemporary.length();
    final multipartFile = http.MultipartFile('image', stream, length,
        filename: path.basename(imageTemporary.path));
    request.files.add(multipartFile);

    // request.files.add(imageTemporary);

    // Send the request
    final response = await request.send();

    // Check the response status code
    if (response.statusCode == 200) {
      // Do something with the response
      final responseString = await response.stream.bytesToString();
      print('Response: $responseString');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(responseString),
            content: Text("You have picked an image from $source"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    } else {
      // Handle the error
      print('Error: ${response.reasonPhrase}');
    }

    // Show a message after picking an image
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
                            image: DecorationImage(
                                image: AssetImage("assets/images/about.png"))),
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
                    "https://i.gifer.com/origin/ae/aea3019ba3e50cf0b10006bf75c51e52_w200.gif"),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              title: "Pick from Gallery",
              icon: Icons.upload_file,
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
