import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/utils/gradients.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text, required this.onTap, this.width});
  final String text;
  final VoidCallback onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 5,
        child: Container(
            width: width ?? double.infinity,
            height: 56,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.goldBorder, width: 2),
                borderRadius: BorderRadius.circular(8),
                gradient: const RadialGradient(colors: [
                  AppColors.buttonLightColor,
                  AppColors.buttonDarkColor,
                ], radius: 3)),
            alignment: Alignment.center,
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return AppGradients.goldWhiteGr.createShader(rect);
              },
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: AppTypography.buttonText20,
              ),
            )
        ),
      ),
    );
  }
}
