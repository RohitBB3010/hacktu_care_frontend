import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hacktu_care_frontend/constants/color_consts.dart';

Widget CustomButton(
    BuildContext context,
    String buttonText,
    Color? buttonColor,
    void Function() onPressed,
    double? buttonWidth,
    double? buttonHeight,
    double? buttonRadius) {
  return SizedBox(
    width: buttonWidth != null
        ? MediaQuery.of(context).size.width * buttonWidth
        : MediaQuery.of(context).size.width * 0.8,
    height: buttonHeight != null
        ? MediaQuery.of(context).size.height * buttonHeight
        : MediaQuery.of(context).size.height * 0.06,
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: buttonColor != null
                ? buttonColor.withOpacity(0.25)
                : Colors.black.withOpacity(0.25),
            blurRadius: 25.0,
            spreadRadius: 10.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? ColorConsts().secondary,
          shape: RoundedRectangleBorder(
            side: buttonColor == null || buttonColor != ColorConsts().accent
                ? BorderSide(
                    color: ColorConsts().accent.withAlpha(100),
                  )
                : BorderSide.none,
            borderRadius: BorderRadius.circular(buttonRadius ?? 10.0),
          ),
        ),
        child: AutoSizeText(
          buttonText,
          maxLines: 1,
          style: const TextStyle(
              color: Colors.white, fontSize: 30.0, fontFamily: 'Poppins'),
        ),
      ),
    ),
  );
}
