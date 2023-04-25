import 'package:flutter/material.dart';

class AppThemes {
  static bool isDarkMode(BuildContext context){
    return MediaQuery.of(context).platformBrightness== Brightness.dark;
  }

  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff00a884),
          primary: Color(0xff00a884),
          secondary: Color(0xff25d366),
          background: Colors.white,
          tertiary: Colors.blue,
      ));

  static ThemeData darkTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff212d39),
          primary: Color(0xff212d39),
          secondary: Color(0xff1ebea5),
          background: Color(0xff101e29),
          onBackground: Colors.white,
          tertiary: Colors.green));
}
