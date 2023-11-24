import 'package:flutter/material.dart';
import 'package:polytech_visits/utils/styles/color_palette.dart';

Widget customFullWidthButtonWithIcon(
  VoidCallback onTap, {
  Color backgroundColor = ColorPalette.main,
  Color iconColor = Colors.white,
  IconData icon = Icons.ac_unit,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size.fromHeight(80),
      ),
      onPressed: onTap,
      child: Icon(
        icon,
        color: iconColor,
        size: 40,
      ),
    ),
  );
}
