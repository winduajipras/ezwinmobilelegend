import 'package:flutter/material.dart';

class AppColors {
  static const hintText = Color(0xFFC7C7CD);
  static const navy = Color(0xFF231750);
  static const lime = Color(0xff40ffaf);
  static const status = Color(0xffe96b52);
  static const trwhite = Color.fromARGB(19, 255, 255, 255);
  static const white = Color(0xffffffff);
}

class Palette {
  static const MaterialColor primary = MaterialColor(
    0xFF231750, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFF231750), //10%
      100: Color(0xFF231750), //20%
      200: Color(0xFF231750), //30%
      300: Color(0xFF231750), //40%
      400: Color(0xFF231750), //50%
      500: Color(0xFF231750), //60%
      600: Color(0xFF231750), //70%
      700: Color(0xFF231750), //80%
      800: Color(0xFF231750), //90%
      900: Color(0xFF231750), //100%
    },
  );

  static const MaterialColor secondary = MaterialColor(
    0xff40ffaf, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff40ffaf), //10%
      100: Color(0xff40ffaf), //20%
      200: Color(0xff40ffaf), //30%
      300: Color(0xff40ffaf), //40%
      400: Color(0xff40ffaf), //50%
      500: Color(0xff40ffaf), //60%
      600: Color(0xff40ffaf), //70%
      700: Color(0xff40ffaf), //80%
      800: Color(0xff40ffaf), //90%
      900: Color(0xff40ffaf), //100
    },
  );

  static const MaterialColor status = MaterialColor(
    0xffe96b52, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffe96b52), //10%
      100: Color(0xffe96b52), //20%
      200: Color(0xffe96b52), //30%
      300: Color(0xffe96b52), //40%
      400: Color(0xffe96b52), //50%
      500: Color(0xffe96b52), //60%
      600: Color(0xffe96b52), //70%
      700: Color(0xffe96b52), //80%
      800: Color(0xffe96b52), //90%
      900: Color(0xffe96b52), //100
    },
  );
}
