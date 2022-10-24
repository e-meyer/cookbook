import 'package:cookbook/components/favourite_button.dart';
import 'package:cookbook/components/recipe_details.dart';
import 'package:cookbook/components/close_button.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:flutter/material.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.lightGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/loading-gif.gif',
                  image: recipe.image,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 360, left: 30),
                child: FavouriteButton(),
              ),
              const Align(
                alignment: Alignment.topRight,
                child: CloseViewButton(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: RecipeDetails(
              recipeName: recipe.name,
              numIngredients: 5,
              numSteps: 3,
            ),
          ),
        ],
      ),
    );
  }
}
