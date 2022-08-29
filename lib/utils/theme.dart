import 'package:banking_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: MyColors.basicWhite,
    cardColor: MyColors.basicWhite,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: MyColors.basicWhite,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: MyColors.basicWhite,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(headline1: TextStyle(color: MyColors.basicBlack)),
  );
  static final darkTheme = ThemeData(
    cardColor: MyColors.gray6,
    scaffoldBackgroundColor: MyColors.basicBlack,
    appBarTheme: const AppBarTheme(
      backgroundColor: MyColors.basicBlack,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: MyColors.basicBlack,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(headline1: TextStyle(color: MyColors.basicWhite)),
  );
}
