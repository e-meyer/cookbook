import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cookbook/helpers/colorpallete.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Center(
        child: SvgPicture.asset(
          'assets/icons/not-found.svg',
          color: ColorPallete.defaultGrey,
        ),
      ),
    );
  }
}
