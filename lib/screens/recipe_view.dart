import 'package:cookbook/components/favourite_button.dart';
import 'package:cookbook/components/recipe_details.dart';
import 'package:cookbook/components/close_button.dart';
import 'package:cookbook/components/tab_bar.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:flutter/material.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.lightGrey,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/loading-gif.gif',
                    image: widget.recipe.image,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 360, left: 20),
                  child: FavouriteButton(),
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: CloseViewButton(),
                ),
              ],
            ),
            TabBarSelector(
              recipe: widget.recipe,
            ),
          ],
        ),
      ),
    );
  }
}
