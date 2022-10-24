class Recipe {
  final String name;
  final String image;
  final int numIngredients;
  final List ingredientsList;
  final int numInstructions;
  final List instructionsList;

  Recipe({
    required this.name,
    required this.image,
    required this.numIngredients,
    required this.ingredientsList,
    required this.numInstructions,
    required this.instructionsList,
  });

  factory Recipe.fromJson(json) {
    final instructionsList =
        json['strInstructions'].toString().replaceAll('STEP', '').split('\r\n');

    // Some instructions come with double '\r\n' so to make sure to remove those empty lines
    instructionsList.removeWhere(((element) => element.isEmpty));

    final ingredientsList = [];
    int ingIndex = 1;
    while (json['strIngredient$ingIndex'] != '' &&
        json['strIngredient$ingIndex'] != null) {
      ingredientsList.add(json['strIngredient$ingIndex']);
      ingIndex++;
    }

    return Recipe(
      name: json['strMeal'] as String,
      image: json['strMealThumb'] as String,
      numIngredients: ingredientsList.length,
      numInstructions: instructionsList.length,
      ingredientsList: ingredientsList,
      instructionsList: instructionsList,
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $image}';
  }
}
