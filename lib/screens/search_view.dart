import 'package:cookbook/components/search_recipe_card.dart';
import 'package:cookbook/components/search_bar.dart';
import 'package:cookbook/helpers/debouncer.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cookbook/services/recipe_service.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  List<Recipe>? _recipes = [];

  bool _isLoading = true;

  Future<void> getRecipes(String searchArgs) async {
    setState(() {
      _isLoading = true;
    });
    _recipes = await RecipeService().getRecipes(searchArgs: searchArgs);
    print('RECIPES $_recipes');
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: ColorPallete.lightGrey,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search for recipes',
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Searchbar(getRecipes: getRecipes),
                _isLoading
                    ? CircularProgressIndicator()
                    : _recipes != null
                        ? GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              crossAxisCount: 2,
                            ),
                            shrinkWrap: true,
                            itemCount: _recipes!.length,
                            itemBuilder: (context, index) {
                              return SearchRecipeCard(recipe: _recipes![index]);
                            },
                          )
                        : Text('Tem nada')
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
