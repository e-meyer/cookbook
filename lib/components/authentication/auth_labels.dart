import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthLabel extends StatelessWidget {
  const AuthLabel({super.key, required this.fieldLabel});

  final String fieldLabel;

  @override
  Widget build(BuildContext context) {
    return Text(
      fieldLabel,
      style: GoogleFonts.montserrat(
        fontSize: 16,
        color: ColorPallete.primaryText,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
