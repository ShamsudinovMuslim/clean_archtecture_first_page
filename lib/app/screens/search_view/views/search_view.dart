import 'package:clean_archtecture_first_page/app/components/my_searsh.dart';
import 'package:clean_archtecture_first_page/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/mat.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 45),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(

                      height: 45,
                      decoration: BoxDecoration(
                          color: AppColors.blgreyColor,
                          borderRadius: BorderRadius.circular(16)), 
                      child: TextField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          enabledBorder: OutlineInputBorder(
                        
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          hintText: "Search here...",
                          hintStyle:
                              const TextStyle(color: AppColors.lolgreyColor),
                          prefixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SearchContent(
                    temp: '22',
                    location: 'Yogyakarta, Indonesia',
                    content: '20° ~ 29°',
                    weather: 'Heavy Rain '),
                const SizedBox(height: 20),
                const SearchContent(
                    temp: '26',
                    location: 'Padang, Indonesia',
                    content: '20° ~ 29°',
                    weather: 'Sun Rain '),
                const SizedBox(height: 20),
                const SearchContent(
                    temp: '23',
                    location: 'Padang, Indonesia',
                    content: '10° ~ 20°',
                    weather: 'Moon Windy '),
                const SizedBox(height: 20),
                const SearchContent(
                  temp: '17',
                  location: 'Barcelona,Spain',
                  content: '20° ~ 29°',
                  weather: 'Rain',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
