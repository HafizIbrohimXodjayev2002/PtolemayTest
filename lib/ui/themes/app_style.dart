import 'package:flutter/material.dart';
import 'package:ptolemay/gen/colors.gen.dart';
import 'package:ptolemay/gen/fonts.gen.dart';

class AppStyle {
  const AppStyle._();

  static TextStyle get interW500x14Black => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: ColorName.black,
        fontFamily: FontFamily.inter,
      );
}
