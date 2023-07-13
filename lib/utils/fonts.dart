import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/utils/colors.dart';

class AppTypography {
  const AppTypography._();

  static final _font = GoogleFonts.nunitoSans();

  static final buttonText20 = _font.copyWith(
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

  static final buttonText16 = _font.copyWith(
    foreground: Paint()
      ..shader = const LinearGradient(
              colors: [Color(0xffFFF5E7), Color(0xffFFD69D)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
          .createShader(const Rect.fromLTWH(0, 0, 100, 16)),
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static final font20whiteShadow = _font.copyWith(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      shadows: [
        const Shadow(
          offset: Offset(0, 5.0),
          blurRadius: 40.0,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ]);

  static final font16white = _font.copyWith(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static final font20gold = _font.copyWith(
    color: AppColors.goldBorder,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static final font14whiteShadow = _font.copyWith(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      shadows: [
        const Shadow(
          offset: Offset(0, 5.0),
          blurRadius: 10.0,
          color: Colors.black12,
        ),
      ]);
}
