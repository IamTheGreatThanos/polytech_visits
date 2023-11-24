import 'package:flutter/material.dart';
import 'package:polytech_visits/utils/styles/color_palette.dart';
import 'package:polytech_visits/utils/styles/styles.dart';

Future<void> showCustomSnackBar(BuildContext context, String content,
    {bool isError = false}) async {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      content: Text(content,
          style: ProjectStyles.textStyle_14Regular
              .copyWith(color: ColorPalette.white)),
      action: SnackBarAction(
        label: 'Закрыть',
        textColor: isError ? Colors.red : Colors.yellow,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
