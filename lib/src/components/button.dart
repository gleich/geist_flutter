import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:geist_flutter/shared.dart';

class Button extends StatelessWidget {
  final Widget text;
  final GeistButtonTheme theme;
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
  final ButtonThemeColors darkTheme;
  final ButtonThemeColors lightTheme;

  const GeistButtonTheme({this.darkTheme, this.lightTheme})
      : assert(darkTheme != null || lightTheme != null);

  // must be var due to how the constructor works
  static const normal = GeistButtonTheme(
    lightTheme: ButtonThemeColors(
      foregroundColor: Colors.black,
      borderColor: Colors.black,
    ),
    darkTheme: ButtonThemeColors(
      borderColor: Colors.white,
    ),
  );
  static const secondary = GeistButtonTheme(
    lightTheme: ButtonThemeColors(
      backgroundColor: Colors.black,
    ),
    darkTheme: ButtonThemeColors(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
  );
  static const error = GeistButtonTheme(
    lightTheme: ButtonThemeColors(
      backgroundColor: SharedColors.error,
    ),
  );
  static const success = GeistButtonTheme(
    lightTheme: ButtonThemeColors(
      backgroundColor: SharedColors.success,
    ),
  );
  static const warning = GeistButtonTheme(
    lightTheme: ButtonThemeColors(
      backgroundColor: SharedColors.warning,
    ),
  );
}

class ButtonThemeColors {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;

  const ButtonThemeColors({
    this.backgroundColor = Colors.transparent,
    this.foregroundColor = Colors.white,
    this.borderColor = Colors.transparent,
  });
}
