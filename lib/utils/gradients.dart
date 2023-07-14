import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';

class AppGradients {
  static const LinearGradient goldWhiteGr = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xffFFF4E4), AppColors.goldBorder]);

  static const darkButton = RadialGradient(colors: [
    AppColors.buttonLightColor,
    AppColors.buttonDarkColor,
  ], radius: 2, center: Alignment(0, -0.4));

  static const lightButton = LinearGradient(
      begin: Alignment(-1.00, 0.00),
      end: Alignment(1, 0),
      colors: [Color(0xFF8E7B61), Color(0xFFD1B991)]);
}
