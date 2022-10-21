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
                      'https:\/\/www.themealdb.com\/images\/media\/meals\/yypwwq1511304979.jpg',
                  recipeName: 'Spicy Arrabiata Penne',
                ),
              ],
            ),
          ),
        ),
      ),
      
      // bottomNavigationBar: BottomNavigationBar(
      //   showUnselectedLabels: false,
      //   selectedItemColor: ColorPallete.darkPurple,
      //   unselectedItemColor: ColorPallete.primaryText,
      //   currentIndex: 0,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset('assets/icons/home.svg'),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset('assets/icons/search.svg'),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset('assets/icons/favourite.svg'),
      //       label: 'Favourites',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset('assets/icons/page-flip.svg'),
      //       label: 'Recipes',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset('assets/icons/profile.svg'),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }
}
