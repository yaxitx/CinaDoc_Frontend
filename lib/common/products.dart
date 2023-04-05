import 'package:flutter/material.dart';

class CinnamonProducts extends StatelessWidget {
  // const CinnamonProducts({super.key});

  final String imagePath;

  CinnamonProducts({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      width: 80,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(12),
      // child: Text("Cinnamon"),
    );
  }
}
