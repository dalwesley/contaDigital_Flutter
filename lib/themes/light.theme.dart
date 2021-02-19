import 'package:flutter/material.dart';

const brightness = Brightness.light;
// const brightness = Brightness.dark;
const primaryColor = const Color(0xFF001040);
const accentColor = const Color(0xFF5C80BC);
const backgroundColor = const Color(0xFFF1F1F1);
const textColor = const Color(0xFF3D3B30);
const dangerColor = const Color(0xFFED3237);
const acceptColor = const Color(0xFF5AA300);

ThemeData lightTheme() {
  return ThemeData(
    brightness: brightness,
    textTheme: new TextTheme(
      //----------------------------------------------bodyText
      bodyText1: TextStyle(
        fontFamily: "Bahnschrift",
        fontSize: 35,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        fontFamily: "Bahnschrift",
        fontSize: 25,
        color: primaryColor,
      ),
      //----------------------------------------------headline
      headline1: TextStyle(
        fontFamily: "Bahnschrift",
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: backgroundColor,
      ),
      headline2: TextStyle(
        fontFamily: "Bahnschrift",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: dangerColor,
      ),
      headline3: TextStyle(
        fontFamily: "Bahnschrift",
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      headline4: TextStyle(
        fontFamily: "Bahnschrift",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      headline5: TextStyle(
        fontFamily: "Bahnschrift",
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: primaryColor,
      ),
      headline6: TextStyle(
        fontFamily: "Bahnschrift",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      //----------------------------------------------button
      button: TextStyle(
        fontFamily: "Bahnschrift",
      ),
      //----------------------------------------------caption
      caption: TextStyle(
        fontFamily: "Bahnschrift",
      ),
      //----------------------------------------------subtitle
      subtitle1: TextStyle(
          fontFamily: "Bahnschrift",
          color: primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w600),
      subtitle2: TextStyle(
        fontFamily: "Bahnschrift",
        color: textColor,
        fontSize: 15,
      ),
    ),
    primaryColor: primaryColor,
    accentColor: accentColor,
    backgroundColor: backgroundColor,
    buttonColor: textColor,
  );
}
