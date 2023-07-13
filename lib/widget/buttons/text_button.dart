import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320,
        height: 56,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffFFD69D), width: 2),
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF6A5D45),
            gradient: const RadialGradient(colors: [
              AppColors.buttonLightColor,
              AppColors.buttonDarkColor,
            ], radius: 3)),
        child: TextButton(
          onPressed: onTap,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppTypography.buttonText
          ),
        )
    );
  }
}
