import 'package:cookbook/components/recipe_card.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.lightGrey,
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/cookbook-logo.svg',
                  height: 80,
                ),
                const RecipeCard(
                  recipeImage:
                      'https:\/\/www.themealdb.com\/images\/media\/meals\/yypwwq1511304979.jpg',
                  recipeName: 'Spicy Arrabiata Penne',
                ),
                const RecipeCard(
                  recipeImage:
                      'https:\/\/www.themealdb.com\/images\/media\/meals\/qqwypw1504642429.jpg',
                  recipeName: 'Vietnamese Grilled Pork',
                ),
                const RecipeCard(
                  recipeImage:
                      'https:\/\/www.themealdb.com\/images\/media\/meals\/urzj1d1587670726.jpg',
                  recipeName: 'Big Mac',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
