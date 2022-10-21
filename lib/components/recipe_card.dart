import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipeName,
    required this.recipeImage,
  });

  final String recipeName;
  final String recipeImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xFF808080).withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ColorPallete.plainWhite,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {},
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: SizedBox(
                      height: 345,
                      width: 345,
                      child: Image.network(
                        recipeImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 310, left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color(0xFF808080).withOpacity(0.2),
                            spreadRadius: 0,
                            offset: Offset(0, 5),
                          )
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorPallete.plainWhite,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: ColorPallete.darkPurple,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 35),
                child: Column(
                  children: [
                    Text(
                      recipeName.toUpperCase(),
                      style: GoogleFonts.montserrat(
                        color: ColorPallete.primaryText,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.fastfood_outlined,
                          color: ColorPallete.lightPurple,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '3 ingredients',
                          style: GoogleFonts.montserrat(
                            color: ColorPallete.secondaryText,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.list_alt,
                          color: ColorPallete.lightPurple,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '10 steps',
                          style: GoogleFonts.montserrat(
                            color: ColorPallete.secondaryText,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
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
