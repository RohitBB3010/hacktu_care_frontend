import 'package:flutter/material.dart';
import 'package:hacktu_care_frontend/constants/color_consts.dart';

class CustomTextStyles {
  TextStyle heading({double fontSize = 40}) {
    return TextStyle(
        fontFamily: 'PoppinsSemiBold',
        overflow: TextOverflow.ellipsis,
        fontSize: fontSize,
        color: ColorConsts().secondary);
  }

  TextStyle regular({double fontSize = 18}) {
    return TextStyle(
        fontFamily: 'Poppins',
        overflow: TextOverflow.ellipsis,
        fontSize: fontSize,
        color: ColorConsts().secondary);
  }

  TextStyle textField({double fontSize = 15}) {
    return TextStyle(
        fontFamily: 'PoppinsSemiBold',
        overflow: TextOverflow.ellipsis,
        fontSize: fontSize,
        color: ColorConsts().textFieldText);
  }
}
