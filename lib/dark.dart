library geist_flutter;

import 'package:flutter/material.dart';

class Dark {
  ThemeData get theme => ThemeData(
        brightness: _Other.brightness,
        scaffoldBackgroundColor: _Colors.scaffoldBackground,
        colorScheme: ColorScheme(
          primary: _Colors.primary,
          primaryVariant: _Colors.primary,
          secondary: _Colors.secondary,
          secondaryVariant: _Colors.secondary,
          surface: _Colors.primary,
          background: _Colors.primary,
          error: _Colors.error,
          onPrimary: _Colors.foreground,
          onSecondary: _Colors.foreground,
          onSurface: _Colors.foreground,
          onBackground: _Colors.foreground,
          onError: _Colors.error,
          brightness: _Other.brightness,
        ),
        appBarTheme: AppBarTheme(
          color: _Colors.primary,
          shadowColor: _Colors.secondary,
        ),
      );
}

class _Colors {
  static const scaffoldBackground = Colors.black;
  static const error = Color.fromRGBO(197, 0, 0, 1);
  static const foreground = Colors.white;
  static const primary = Colors.black;
  static const secondary = Color.fromRGBO(17, 17, 17, 1);
}

class _Other {
  static const brightness = Brightness.dark;
}
