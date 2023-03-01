import 'package:fitness_app/helper/const.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme{
  TTextFormFieldTheme._();

  static InputDecorationTheme kPrimaryTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius : BorderRadius.circular(100)),
    prefixIconColor: kPrimaryColor,
    floatingLabelStyle: const TextStyle(color: kPrimaryColor),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 2,color : kPrimaryColor),
    )
  );
}