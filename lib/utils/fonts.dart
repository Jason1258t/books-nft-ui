import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/utils/colors.dart';

class AppTypography {
  const AppTypography._();

  static final _font = GoogleFonts.nunitoSans();
  static const _fontGilroy = TextStyle(fontFamily: 'Gilroy');

  static final buttonText = _font.copyWith(
    foreground: Paint()
      ..shader = const LinearGradient(
              colors: [Color(0xffFFF5E7), Color(0xffFFD69D)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
          .createShader(const Rect.fromLTWH(0, 0, 200, 20)),
    //color: AppColors.buttonText,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static final font20white  = _font.copyWith(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    shadows: [
      const Shadow(
        offset: Offset(0, 5.0),
        blurRadius: 40.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ]
  );

  static final font12w700 = _font.copyWith(
    color: AppColors.bottomNavigationBarText,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static final font24w700Gilroy = _fontGilroy.copyWith(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static final font36w800 = _font.copyWith(
    color: AppColors.numberKeyboard,
    fontSize: 36,
    fontWeight: FontWeight.w800,
  );

  static final font12dark = _fontGilroy.copyWith(
    color: AppColors.darkText,
    fontSize: 12,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w300,
  );

  static final font20w800 = _font.copyWith(
    color: AppColors.lightText,
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );
}
