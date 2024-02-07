import 'package:flutter/material.dart';

class SearchContent extends StatelessWidget {
  final String temp;
  final String location;
  final String content;
  final String weather;
  const SearchContent(
      {super.key,
      required this.temp,
      required this.location,
      required this.content,
      required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215,
      width: 340,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(11, 105, 139, 1),
            Color.fromRGBO(3, 150, 166, 1)
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Text(
                  '$temp°',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                  ),
                ),
                Text(
                  '$weather>',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                '$location',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                '$content',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          )
        ],
      ),
    );
  }
}
