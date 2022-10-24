import 'package:cookbook/router_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CookbookApp());
}

class CookbookApp extends StatelessWidget {
  const CookbookApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cook Book',
      initialRoute: 'navigator',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
