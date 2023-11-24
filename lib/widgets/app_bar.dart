import 'package:flutter/material.dart';
import 'package:polytech_visits/utils/styles/color_palette.dart';
import 'package:polytech_visits/utils/styles/styles.dart';

PreferredSizeWidget buildAppBar(BuildContext context) {
  return AppBar(
    title: Row(
      children: [
        Text(
          "Polytech",
          style: ProjectStyles.textStyle_18Regular
              .copyWith(color: ColorPalette.white),
        ),
        const Spacer(),
        // customIconButton(
        //       () {
        //     context.read<AuthBloc>().add(EventAuthLogout());
        //   },
        //   icon: Icons.exit_to_app,
        // ),
      ],
    ),
  );
}
