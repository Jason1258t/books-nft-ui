import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/utils/colors.dart';

class AppTypography {
  const AppTypography._();

  static final _font = GoogleFonts.nunitoSans();
  static const _fontGilroy = TextStyle(fontFamily: 'Gilroy');

  static final buttonText20 = _font.copyWith(
      foreground: Paint()
        ..shader = const LinearGradient(
                colors: [AppColors.milk, AppColors.goldBorder],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
            .createShader(const Rect.fromLTWH(0, 0, 100, 20)),
      fontSize: 20,
      fontWeight: FontWeight.w700,
      shadows: [
        const Shadow(color: Colors.black45, blurRadius: 4, offset: Offset(0, 3))
      ]);

  static final buttonText16 = _font.copyWith(
    foreground: Paint()
      ..shader = const LinearGradient(
              colors: [AppColors.milk, AppColors.goldBorder],
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
    color: AppColors.darkText,
    fontSize: 36,
    fontWeight: FontWeight.w800,
  );

  static final font12dark = _fontGilroy.copyWith(
    color: AppColors.darkText,
    fontSize: 12,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w300,
  );

  static final font12white = _font.copyWith(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final font10black = _font.copyWith(
    color: Colors.black,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static final font10gold = _font.copyWith(
    color: AppColors.goldBorder,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static final font10blackW400 = _font.copyWith(
    color: Colors.black,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static final font20w800 = _font.copyWith(
    color: AppColors.goldText,
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );

  static final font20gold = _font.copyWith(
    color: AppColors.goldBorder,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static final font20white = _font.copyWith(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static final font16dirtyGold = _font.copyWith(
    color: AppColors.dirtyGold,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static final font24blue = _font.copyWith(
    color: AppColors.lvlText,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 0
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

  static final font24darkShadow = _font.copyWith(
      color: AppColors.goldBorder,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      shadows: [
        const Shadow(
          offset: Offset(0, 5.0),
          blurRadius: 10.0,
          color: Colors.black12,
        ),
      ]);

  static final font24goldShadow = _font.copyWith(
      color: AppColors.goldBorder,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      shadows: [
        const Shadow(
          offset: Offset(0, 5.0),
          blurRadius: 10.0,
          color: Colors.black12,
        ),
      ]);
}
