import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: const Color(0xFF808080).withOpacity(0.2),
            spreadRadius: 0,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: ColorPallete.plainWhite,
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
            color: ColorPallete.darkOrange,
          ),
        ),
      ),
    );
  }
}
