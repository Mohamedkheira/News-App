import 'package:flutter/material.dart';

class AppStyle{
 static const Color lightPrimary = Color(0xff39A552);
 static const Color colorText = Colors.white;
 static const Color textBlack = Color(0xff303030);
 static const Color textHeatBlack = Color(0xff4F5A69);
 static ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: lightPrimary,
   primary: lightPrimary,
  ),
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: AppBarTheme(
   shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
     bottomLeft: Radius.circular(50),
     bottomRight: Radius.circular(50),
    ),
   ),
   iconTheme: IconThemeData(
    color: colorText,
   ),
   color: lightPrimary,
   titleTextStyle: TextStyle(
    fontWeight: FontWeight.w300,
     fontSize: 20,
     color: colorText,
   ),
    centerTitle: true,
  ),
  textTheme: TextTheme(
   titleMedium: TextStyle(
    color: AppStyle.colorText,
    fontWeight: FontWeight.w400,
    fontSize: 24,
   ),
   bodyMedium: TextStyle(
    color: textBlack,
    fontSize: 24,
    fontWeight: FontWeight.w700,
   ),
   headlineLarge:  TextStyle(
    color: textHeatBlack,
    fontSize: 24,
    fontWeight: FontWeight.w700,
   ),
   displaySmall: TextStyle(
    color: Color(0xff79828B),
    fontSize: 10,
    fontWeight: FontWeight.w400,
   ),
      displayLarge:  TextStyle(
  color: Color(0xff79828B),
  fontSize: 14,
  fontWeight: FontWeight.w500,
 )
  ),
 );
}