import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String imageUrl;
  final String text;
  const MyContainer({super.key, required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff7fdff4), Color(0xff0396a6)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(imageUrl),
              height: 25,
            ),
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 10, color: Colors.white),
          )
        ],
      ),
    );
  }
}
