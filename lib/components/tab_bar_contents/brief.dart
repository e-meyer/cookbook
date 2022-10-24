import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:cookbook/components/recipe_details.dart';
import 'package:flutter/material.dart';

class Brief extends StatelessWidget {
  const Brief({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPallete.lightGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
        ),
        child: RecipeDetails(
          recipeName: recipe.name,
          numIngredients: recipe.numIngredients,
          numInstructions: recipe.numInstructions,
        ),
      ),
    );
  }
}
