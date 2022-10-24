import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.lightGrey,
      body: Text('Ingredients'),
    );
  }
}
