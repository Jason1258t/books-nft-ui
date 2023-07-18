import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/fonts.dart';

class ColumnElevatedButton extends StatelessWidget {
  const ColumnElevatedButton(
      {super.key,
      required this.text,
      required this.asset,
      required this.onTap,
      this.gradient = const RadialGradient(colors: [
        AppColors.buttonLightColor,
        AppColors.buttonDarkColor,
      ], radius: 0.8, center: Alignment(0, -0.6))});

  final String text;
  final String asset;
  final VoidCallback onTap;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.goldBorder, width: 2),
            borderRadius: BorderRadius.circular(8),
            ),
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
            disabledForegroundColor: Colors.transparent,
            shadowColor: Colors.black12,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                asset,
                width: 24,
                color: AppColors.goldBorder,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: AppTypography.font10gold
              ),
            ],
          ),
        ));
  }
}
