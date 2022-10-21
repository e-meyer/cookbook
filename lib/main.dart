import 'package:cookbook/screens/authentication_view.dart';
import 'package:cookbook/screens/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cook Book',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/auth',
      routes: {
        '/': (context) => const HomeScreen(),
        '/auth': (context) => const Authentication(),
      },
    );
  }
}
