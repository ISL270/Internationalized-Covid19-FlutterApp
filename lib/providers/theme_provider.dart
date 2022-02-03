import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Color(0xffea4b4b)),
          color: Colors.white,
          titleTextStyle: TextStyle(
              color: Color(0xffea4b4b),
              fontFamily: 'PantonBoldItalic',
              fontSize: 16,
              fontWeight: FontWeight.bold)),
      textTheme: TextTheme(
          headline3: TextStyle(fontSize: 14, color: Color(0xff656565)),
          headline4: TextStyle(
              color: Color(0xffea4b4b),
              fontWeight: FontWeight.w300,
              fontSize: 28),
          headline5: TextStyle(
              color: Color(0xff666666),
              fontSize: 16,
              fontFamily: 'PantonBoldItalic',
              fontWeight: FontWeight.bold)),
      scaffoldBackgroundColor: Color(0xFFF6F6F6),
      cardColor: Color(0xFFFFFFFF),
      dividerColor: Colors.grey[400]);

  static final darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Color(0xff0892fd)),
          color: Color(0xff4d4d4d),
          titleTextStyle: TextStyle(
              color: Color(0xff0892fd),
              fontFamily: 'PantonBoldItalic',
              fontSize: 16,
              fontWeight: FontWeight.bold)),
      textTheme: TextTheme(
          headline3: TextStyle(fontSize: 14, color: Color(0xffd9d9d9)),
          headline4: TextStyle(
              color: Color(0xff0892fd),
              fontWeight: FontWeight.w300,
              fontSize: 28),
          headline5: TextStyle(
              color: Color(0xffd9d9d9),
              fontSize: 16,
              fontFamily: 'PantonBoldItalic',
              fontWeight: FontWeight.bold)),
      scaffoldBackgroundColor: Color(0xff585858),
      cardColor: Color(0xff5c5c5c),
      dividerColor: Colors.white38);
}
