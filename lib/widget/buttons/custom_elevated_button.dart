import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/utils/gradients.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
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
                style: AppTypography.buttonText,
              ),
            )
        ),
      ),
    );
  }
}
