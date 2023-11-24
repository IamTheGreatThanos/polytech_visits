import 'package:flutter/material.dart';
import 'package:polytech_visits/utils/styles/color_palette.dart';
import 'package:polytech_visits/utils/styles/styles.dart';

Widget customTextButton(VoidCallback onTap,
    {String title = 'title',
    double width = 300,
    Color mainColor = ColorPalette.main,
    Color secondaryColor = ColorPalette.white}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: mainColor,
          minimumSize: const Size.fromHeight(60), // NEW
        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Text(title, style: ProjectStyles.textStyle_14Bold),
        ),
      ),
    ),
  );
}
