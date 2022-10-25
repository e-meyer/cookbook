import 'package:cookbook/components/search/search_loading.dart';
import 'package:cookbook/components/search/search_not_found.dart';
import 'package:cookbook/components/search/search_bar.dart';
import 'package:cookbook/components/search/search_result.dart';
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

  bool _isLoading = false;

  Future<void> getRecipes(String searchArgs) async {
    setState(() {
      _isLoading = true;
    });
    _recipes = await RecipeService().getRecipes(searchArgs: searchArgs);
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
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search for recipes',
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Searchbar(getRecipes: getRecipes),
                _isLoading
                    ? const SearchLoading()
                    : _recipes != null
                        ? SearchResults(recipes: _recipes!)
                        : const SearchNotFound(),
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
