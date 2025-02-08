import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hacktu_care_frontend/constants/color_consts.dart';

SnackBar customSnackbar(String snackbarText, IconData? icon) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        if (icon != null)
          Icon(
            icon,
            color: ColorConsts().primary,
          ),
        Expanded(
          child: AutoSizeText(snackbarText,
              style: TextStyle(
                  color: ColorConsts().primary, fontFamily: 'Poppins')),
        )
      ],
    ),
  );
}
