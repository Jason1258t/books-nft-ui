import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/utils/colors.dart';

class AppTypography {
  const AppTypography._();

  static final _font = GoogleFonts.nunitoSans();

  static final buttonText = _font.copyWith(
    foreground: Paint()
      ..shader = const LinearGradient(
              colors: [Color(0xffFFF5E7), Color(0xffFFD69D)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
          .createShader(Rect.fromLTWH(0, 0, 200, 20)),
    //color: AppColors.buttonText,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
}
