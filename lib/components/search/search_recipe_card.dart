import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchRecipeCard extends StatelessWidget {
  const SearchRecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'recipe-details', arguments: recipe);
        },
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                    recipe.image,
                  ),
                ),
              ),
              height: 350.0,
            ),
            Container(
              height: 350.0,
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black,
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 10,
                left: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      recipe.name,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: ColorPallete.plainWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    recipe.numIngredients >= 8
                        ? recipe.numIngredients > 14
                            ? 'Hard'
                            : 'Medium'
                        : 'Easy',
                    style: GoogleFonts.montserrat(
                        fontSize: 12, color: ColorPallete.darkGrey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
