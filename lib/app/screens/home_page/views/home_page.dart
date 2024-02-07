import 'dart:convert';

import 'package:clean_archtecture_first_page/app/components/my_container.dart';
import 'package:clean_archtecture_first_page/app/components/my_listView_builder.dart';
import 'package:clean_archtecture_first_page/app/components/my_widget.dart';
import 'package:clean_archtecture_first_page/app/constants/app_colors.dart';
import 'package:clean_archtecture_first_page/app/screens/home_page/model/home_model.dart';
import 'package:clean_archtecture_first_page/app/screens/search_view/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? cityName;
  String? countryCod;
  dynamic temp;
  @override
  void initState() {
    getWeather();
    super.initState();
  }

  void getWeather() async {
    Uri url = Uri.parse(
        'https://api.weatherbit.io/v2.0/forecast/daily?city=bishkek&key=6b13c6f9d1a04aaa94d603456c11fd6d');
    final data = await Client().get(url);
    final response = data.body;
    final jsonData = jsonDecode(response);
    temp = jsonData['data'][0]['temp'];
    cityName = jsonData['city_name'];
    countryCod = jsonData['country_code'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/mat.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchView()),
                        );
                      },
                      child: const Icon(
                        Icons.search,
                        size: 32,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 80),
                  Center(
                    child: Text(
                      '${cityName}',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Text(
                '${countryCod}',
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 28),
              Center(
                child: Text(
                  "$temp°",
                  style: TextStyle(
                    fontSize: 96,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              const Image(
                image: AssetImage(
                  'assets/images/w.png',
                ),
                height: 160,
                alignment: Alignment.center,
              ),
              MyLB(),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    MyWidget(
                      iscolor: true,
                    ),
                    SizedBox(
                      height: 34,
                    ),
                    MyWidget(
                      iscolor: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
