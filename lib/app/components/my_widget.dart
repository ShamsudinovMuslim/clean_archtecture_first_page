import 'package:clean_archtecture_first_page/app/components/my_container.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final bool iscolor;
  const MyWidget({super.key, required this.iscolor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyContainer(
          imageUrl:
              iscolor ? 'assets/images/temp.png' : 'assets/images/wind.png',
          text: iscolor ? 'Temperature High' : 'SW 10 km/h',
        ),
        SizedBox(
          width: 35,
        ),
        MyContainer(
          imageUrl: iscolor ? 'assets/images/wat.png' : 'assets/images/sun.png',
          text: iscolor ? 'Humidity 70%' : 'UV Weak',
        ),
        SizedBox(
          width: 35,
        ),
        MyContainer(
          imageUrl: iscolor
              ? 'assets/images/mountain.png'
              : 'assets/images/hamidity.png',
          text: iscolor ? 'Visibliyty 6 km' : 'Air Pressure 900 hPa',
        )
      ],
    );
  }
}
