import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/utils/gradients.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.width,
      this.borderColor,
      this.gradient = const RadialGradient(colors: [
        AppColors.buttonLightColor,
        AppColors.buttonDarkColor,
      ], radius: 3)});

  final String text;
  final VoidCallback onTap;
  final double? width;
  final Gradient gradient;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? double.infinity,
        height: 56,
        decoration: BoxDecoration(
            border: Border.all(
                color: borderColor ?? AppColors.goldBorder, width: 2),
            borderRadius: BorderRadius.circular(8),
            gradient: gradient),
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              elevation: 5,
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShaderMask(
                      shaderCallback: (Rect rect) =>
                          AppGradients.goldWhiteGr.createShader(rect),
                      child: Text(text,
                          textAlign: TextAlign.center, style: AppTypography.buttonText20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
