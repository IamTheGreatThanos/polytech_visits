import 'package:flutter/material.dart';

import '../utils/styles/color_palette.dart';
import '../utils/styles/styles.dart';

Widget customTextFormField(
  VoidCallback onChanged, {
  TextEditingController? controller,
  String hintText = '',
  Color hintColor = ColorPalette.lightGrey,
  Icon? icon,
  Color borderColor = ColorPalette.black,
  Color textColor = ColorPalette.lightGrey,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      controller: controller,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: hintColor),
        ),
        icon: icon,
        hintText: hintText,
        hintStyle: ProjectStyles.textStyle_14Regular.copyWith(color: hintColor),
        labelStyle: ProjectStyles.textStyle_14Regular,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 3, color: ColorPalette.secondary),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Пожалуйста заполните поле';
        }
        return null;
      },
      onChanged: (value) {
        onChanged();
      },
    ),
  );
}
