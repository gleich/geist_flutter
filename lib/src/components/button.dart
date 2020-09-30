import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:geist_flutter/shared.dart';

class Button extends StatelessWidget {
  final Widget text;
  final GeistTheme<GeistButtonTheme> theme;
  final Function() onPressed;

  Button({this.text, this.onPressed, this.theme = GeistButtonTheme.normal});

  @override
  Widget build(BuildContext ctx) {
    final isDark = Theme.of(ctx).brightness == Brightness.dark ? true : false;

    final themeColors = isDark
        ? (theme.darkTheme ?? theme.lightTheme)
        : (theme.lightTheme ?? theme.darkTheme);

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 150,
      ),
      child: FlatButton(
        onPressed: this.onPressed,
        child: this.text,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: themeColors.borderColor),
        ),
        color: themeColors.backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textColor: themeColors.foregroundColor,
      ),
    );
  }
}

class GeistButtonTheme {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;

  const GeistButtonTheme({
    this.backgroundColor = Colors.transparent,
    this.foregroundColor = Colors.white,
    this.borderColor = Colors.transparent,
  });

  static const normal = GeistTheme<GeistButtonTheme>(
    lightTheme: GeistButtonTheme(
      foregroundColor: Colors.black,
      borderColor: Colors.black,
    ),
    darkTheme: GeistButtonTheme(
      borderColor: Colors.white,
    ),
  );
  static const secondary = GeistTheme<GeistButtonTheme>(
    lightTheme: GeistButtonTheme(
      backgroundColor: Colors.black,
    ),
    darkTheme: GeistButtonTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
  );
  static const error = GeistTheme<GeistButtonTheme>(
    lightTheme: GeistButtonTheme(
      backgroundColor: SharedColors.error,
    ),
  );
  static const success = GeistTheme<GeistButtonTheme>(
    lightTheme: GeistButtonTheme(
      backgroundColor: SharedColors.success,
    ),
  );
  static const warning = GeistTheme<GeistButtonTheme>(
    lightTheme: GeistButtonTheme(
      backgroundColor: SharedColors.warning,
    ),
  );
}
