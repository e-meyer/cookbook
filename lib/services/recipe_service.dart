import 'dart:io';
import 'dart:math';
import 'package:cookbook/services/webclient.dart';
import 'package:http/http.dart' as http;
import 'package:cookbook/models/recipe.dart';
import 'dart:convert';

const _chars = 'abcdefghijklmnopqrstuvwxyz';

class RecipeService {
  String url = WebClient.url;
  String apiKey = WebClient.apiKey;
  String searchRequest = WebClient.searchRequest;
  http.Client client = WebClient().client;

  _getUrl() {
    return '$url$apiKey';
  }

  _getSearchRequest() {
    return '${_getUrl()}$searchRequest';
  }

  Future<List<Recipe>> getRecipes({String? searchArgs}) async {
    if (searchArgs == null) {
      searchArgs = _getRandomChar();
    }

    print('${_getSearchRequest()}$searchArgs');

    final response = await client.get(
      Uri.parse('${_getSearchRequest()}$searchArgs'),
    );

    if (response.statusCode != 200) {
      throw HttpException(response.body);
    }

    Map data = jsonDecode(response.body);
    List tempRecipes = [];

    for (var recipe in data['meals']) {
      tempRecipes.add(recipe);
    }

    return Recipe.recipesFromSnapshot(tempRecipes);
  }

  _getRandomChar() {
    return _chars[Random().nextInt(26)];
  }
}
