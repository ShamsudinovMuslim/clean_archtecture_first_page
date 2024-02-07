import 'dart:convert';

import 'package:clean_archtecture_first_page/app/screens/home_page/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyLB extends StatefulWidget {
  const MyLB({super.key});

  @override
  State<MyLB> createState() => _MyLBState();
}

class _MyLBState extends State<MyLB> {
  List<dynamic> temperatures = List.filled(16, null);
  @override
  void initState() {
    getWeather();
    super.initState();
  }

  void getWeather() async {
    Uri url = Uri.parse(
        'https://api.weatherbit.io/v2.0/forecast/daily?city=Osh&key=6b13c6f9d1a04aaa94d603456c11fd6d');
    final data = await Client().get(url);
    final response = data.body;
    final jsonData = jsonDecode(response);
    for (int i = 0; i < 16; i++) {
      temperatures[i] = jsonData['data'][i]['temp'];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      child: ListView.builder(
        itemCount: 16,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 60,
            height: 146,
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xff0b698b),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    ocklock[index],
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(169, 10, 19, 103),
                  backgroundImage: AssetImage(imageUrl[index]),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    '${temperatures[index]}°',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
