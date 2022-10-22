import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthField extends StatefulWidget {
  AuthField({
    super.key,
    required this.focusNode,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.password,
  });

  final FocusNode focusNode;
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  String? password;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.hintText.contains('password') ? true : false,
      validator: (value) {
        if (widget.hintText.contains('password')) {
          return _passwordValidator(value);
        } else if (widget.hintText.contains('name')) {
          print('2');
        } else if (widget.hintText.contains('e-mail')) {
          print('3');
        }
        if (value == null || value.isEmpty) {
          return 'Empty field';
        }
        return null;
      },
      style: GoogleFonts.montserrat(),
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        suffixIcon: Icon(
          widget.prefixIcon,
          color:
              widget.focusNode.hasFocus ? ColorPallete.darkOrange : Colors.grey,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorPallete.lightOrange,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorPallete.darkGrey,
          ),
        ),
        suffixIconColor: ColorPallete.lightOrange,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorPallete.lightOrange,
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

  _passwordValidator(value) {
    if (value.isEmpty) {
      return 'Input a password';
    } else if (widget.password != null && value != widget.password) {
      return 'Passwords must be equal';
    }

    return null;
  }
}
