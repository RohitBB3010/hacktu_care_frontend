import 'package:flutter/material.dart';
import 'package:hacktu_care_frontend/constants/color_consts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {required this.fieldWidth,
      required this.fieldHeight,
      this.hintText,
      this.inputType,
      this.prefixText,
      this.prefixIconData,
      this.suffixIconData,
      this.suffixIconPressed,
      this.isEnabled,
      this.controller,
      required this.onChanged,
      this.obscureBool});

  final double fieldWidth;
  final double fieldHeight;
  final String? hintText;
  final TextInputType? inputType;
  final String? prefixText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final void Function()? suffixIconPressed;
  final bool? isEnabled;
  final TextEditingController? controller;
  final void Function(String) onChanged;
  final bool? obscureBool;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * fieldWidth,
      height: MediaQuery.of(context).size.height * fieldHeight,
      child: TextFormField(
        enabled: isEnabled,
        keyboardType: inputType ?? TextInputType.text,
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureBool ?? false,
        decoration: InputDecoration(
          fillColor: ColorConsts().textField,
          filled: true,
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(15), // Set border radius to 15
              borderSide: BorderSide.none),
          hintText: hintText,
          hintStyle: TextStyle(
              color: ColorConsts().textFieldText, fontFamily: 'Poppins'),
          prefixText: prefixText,
          prefixIcon: prefixIconData != null
              ? Icon(
                  prefixIconData,
                  color: ColorConsts().textFieldText,
                )
              : null,
          suffixIcon: suffixIconData != null
              ? IconButton(
                  onPressed: suffixIconPressed, icon: Icon(suffixIconData))
              : null,
        ),
        style: const TextStyle(fontFamily: 'Poppins'),
      ),
    );
  }
}
