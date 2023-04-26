import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_ui/constants.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackgroundColor,
    fontFamily: "Poppins",
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hintColor: Colors.transparent,
    hoverColor: Colors.transparent,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyLarge: TextStyle(color: kTextColor,fontFamily: "Poppins"),
    bodyMedium: TextStyle(color:kSubTextColor),
    bodySmall: TextStyle(color: kSubTextColor)
  );
}
AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: kPrimaryColor,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white), systemOverlayStyle: SystemUiOverlayStyle.light, toolbarTextStyle: const TextTheme(
    titleLarge: TextStyle(color: Colors.white, fontSize: 18),
  ).bodyMedium, titleTextStyle: const TextTheme(
    titleLarge: TextStyle(color: Colors.white, fontSize: 18),
  ).titleLarge,
  );
}