class Recipe {
  final String name;
  final String image;
  final List ingredientsList;
  final List instructionsList;
  final List ingredientsMeasure;

  Recipe({
    required this.ingredientsMeasure,
    required this.name,
    required this.image,
    required this.ingredientsList,
    required this.instructionsList,
  });

  factory Recipe.fromJson(json) {
    RegExp stepRegex = RegExp(r'(\b((STEP) \d+)+\b)', caseSensitive: false);

    // getting the instructions, cleaning the list recieved as much as possible
    final instructionsList = json['strInstructions']
        .toString()
        .replaceAll(stepRegex, '')
        .replaceAll('\r\n', ' ')
        .replaceAll('. (', '. ')
        .replaceAll('.) ', '. ')
        .split('.');

    instructionsList.removeWhere((element) => element.isEmpty);
    instructionsList.removeWhere((element) => double.tryParse(element) != null);

    // putting the ingredients recieved from the API in a list
    final ingredientsList = [];
    int index = 1;

    while (json['strIngredient$index'] != '' &&
        json['strIngredient$index'] != null) {
      ingredientsList.add(json['strIngredient$index']);
      index++;
    }

    // putting the ingredients measure recieved from the API in a list
    final ingredientsMeasure = [];
    index = 1;

    while (json['strMeasure$index'] != '' && json['strMeasure$index'] != null) {
      ingredientsMeasure.add(json['strMeasure$index']);
      index++;
    }

    return Recipe(
      name: json['strMeal'] as String,
      image: json['strMealThumb'] as String,
      ingredientsMeasure: ingredientsMeasure,
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
