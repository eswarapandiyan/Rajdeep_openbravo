import 'package:flutter/material.dart';
import '../constants/index_constant.dart';
import 'widget_themes/index_widget_theme.dart';

class WAppTheme {
  WAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: WColors.grey,
    brightness: Brightness.light,
    primaryColor: WColors.primary,
    textTheme: WTextTheme.lightTextTheme,
    chipTheme: WChipTheme.lightChipTheme,
    scaffoldBackgroundColor: WColors.white,
    appBarTheme: WAppBarTheme.lightAppBarTheme,
    checkboxTheme: WCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: WBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: WElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: WOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: WTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: WColors.grey,
    brightness: Brightness.dark,
    primaryColor: WColors.primary,
    textTheme: WTextTheme.darkTextTheme,
    chipTheme: WChipTheme.darkChipTheme,
    scaffoldBackgroundColor: WColors.black,
    appBarTheme: WAppBarTheme.darkAppBarTheme,
    checkboxTheme: WCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: WBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: WElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: WOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: WTextFormFieldTheme.darkInputDecorationTheme,
  );
}
