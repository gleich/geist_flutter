import 'package:flutter/material.dart';

class SharedColors {
  static const error = Color(0xFFEE0000);
  static const success = Color(0xFF0070F3);
  static const warning = Color(0xFFF5A623);
}

class GeistTheme<T> {
  final T darkTheme;
  final T lightTheme;

  const GeistTheme({this.darkTheme, this.lightTheme})
      : assert(darkTheme != null || lightTheme != null);
}
