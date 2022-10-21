import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    super.key,
    required this.focusNode,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
  });

  final FocusNode focusNode;
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        suffixIcon: Icon(
          widget.prefixIcon,
          color:
              widget.focusNode.hasFocus ? ColorPallete.darkPurple : Colors.grey,
        ),
        suffixIconColor: ColorPallete.lightPurple,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorPallete.lightPurple,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorPallete.lightGrey,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.montserrat(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: ColorPallete.darkGrey,
        ),
        border: InputBorder.none,
        fillColor: ColorPallete.defaultGrey,
        filled: true,
      ),
    );
  }
}
