import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorPallete.darkOrange,
      style: GoogleFonts.montserrat(),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        hintText: 'Something delicious',
        hintStyle: GoogleFonts.montserrat(
          color: ColorPallete.darkGrey,
          fontSize: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorPallete.lightGrey,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        isDense: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(20),
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            color: ColorPallete.darkGrey,
          ),
        ),
        filled: true,
        fillColor: ColorPallete.defaultGrey,
      ),
      autofocus: true,
    );
  }
}
