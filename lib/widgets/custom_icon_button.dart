import 'package:flutter/material.dart';
import 'package:polytech_visits/utils/styles/color_palette.dart';

Widget customIconButton(VoidCallback onTap,
    {IconData icon = Icons.home,
    double iconSize = 24,
    double width = 60,
    double height = 40,
    double paddingAll = 10,
    Color mainColor = ColorPalette.secondary,
    Color secondaryColor = ColorPalette.white}) {
  return Padding(
    padding: EdgeInsets.all(paddingAll),
    child: SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: mainColor,
          minimumSize: const Size.fromHeight(60), // NEW
        ),
        onPressed: onTap,
        child: Icon(
          icon,
          color: secondaryColor,
          size: iconSize,
        ),
      ),
    ),
  );
}
