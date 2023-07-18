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
  ], radius: 1.5, center: Alignment(0, -1));

  static const lightButton = LinearGradient(
      begin: Alignment(-1.00, 0.00),
      end: Alignment(1, 0),
      colors: [
        AppColors.smallEvButtonBackgroundDark,
        AppColors.smallEvButtonBackgroundLight
      ]);

  static const bottomSheet = LinearGradient(
      begin: Alignment(0.00, -1.00),
      end: Alignment(0, 1),
      colors: [
        AppColors.smallEvButtonBackgroundLight,
        AppColors.bottomSheetDark
      ]);

  static const smallButtonBorder = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0.8, 1],
    colors: [
      AppColors.smallEvButtonBorderDark,
      AppColors.smallEvButtonBorderLight,
    ],
  );

  static const smallButtonBackground = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      AppColors.smallEvButtonBackgroundDark,
      AppColors.smallEvButtonBackgroundLight,
    ],
  );

  static const wordContainer = LinearGradient(
    begin: Alignment(-1.00, 0.00),
    end: Alignment(1, 0),
    colors: [
      AppColors.smallEvButtonBackgroundLight,
      AppColors.smallEvButtonBackgroundDark
    ],
  );


  static const wardrobeButtons = RadialGradient(
      colors: [AppColors.wardrobeButtonLight, AppColors.buttonDarkColor],
      radius: 1.2,
      center: Alignment(0, -0.3));
}
