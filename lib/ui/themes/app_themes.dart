import 'package:ptolemay/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ptolemay/gen/fonts.gen.dart';

class Themes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: FontFamily.inter,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: ColorName.black,
        fontSize: 26,
      ),
      headline6: TextStyle(
        color: ColorName.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(color: ColorName.black),
      titleTextStyle: TextStyle(color: ColorName.black),
    ),
    backgroundColor: ColorName.white,
    scaffoldBackgroundColor: ColorName.white,
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: FontFamily.inter,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: ColorName.white,
        fontSize: 26,
      ),
      headline6: TextStyle(
        color: ColorName.white,
      ),
    ),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      elevation: 0,
    centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    backgroundColor: const Color(0xff333333),
    scaffoldBackgroundColor: const Color(0xff333333),
  );
}
