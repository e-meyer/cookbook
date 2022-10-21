import 'package:cookbook/screens/authentication_view.dart';
import 'package:cookbook/screens/home_view.dart';
import 'package:cookbook/screens/register_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cook Book',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/register',
      routes: {
        '/': (context) => const HomeScreen(),
        '/auth': (context) => const AuthenticationScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
