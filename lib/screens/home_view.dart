import 'package:cookbook/components/recipe_card.dart';
import 'package:cookbook/helpers/colorpallete.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:cookbook/services/recipe_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  List<Recipe> _recipes = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeService().getRecipe();
    _recipes.shuffle();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> refresh() async {
    setState(() {
      _isLoading = true;
    });
    _recipes = await RecipeService().getRecipe();
    _recipes.shuffle();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: ColorPallete.lightGrey,
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SvgPicture.asset('assets/cookbook-logo.svg'),
                _isLoading
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: _recipes.length,
                        itemBuilder: (context, index) {
                          return RecipeCard(
                            recipe: _recipes[index],
                          );
                        },
                      ),
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
