import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parasut_rover_flutter/core/theme/theme_service.dart';

class ThemeController extends ChangeNotifier {
  ThemeService service = ThemeService();

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  ThemeController() {
    _isDarkTheme = service.getThemeFromStorage();
    notifyListeners();
  }

  toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Color(0xFFd72323),
      colorScheme: ColorScheme.light(
        secondary: Color(0xFFd72323),
        secondaryVariant: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onBackground: Colors.white,
      ),
      backgroundColor: Color(0xFFeeeeee),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFFd72323),
      ),
      inputDecorationTheme:
          InputDecorationTheme(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFd72323),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFd72323),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Color(0xFFd72323),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFd72323),
        ),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF303841),
      ),
      colorScheme: ColorScheme.light(
        secondary: Color(0xFFd72323),
        secondaryVariant: Color(0xFF303841),
        onSecondary: Colors.white,
        onBackground: Colors.black,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF303841),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFeeeeee),
      ),
    );
  }
}
