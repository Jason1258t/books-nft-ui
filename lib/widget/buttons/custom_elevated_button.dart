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
        this.height = 56,
      this.borderColor,
      this.gradient =  AppGradients.darkButton});

  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Gradient gradient;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(
                color: borderColor ?? AppColors.goldBorder, width: 2),
            borderRadius: BorderRadius.circular(8),
            gradient: gradient),
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              disabledBackgroundColor: Colors.transparent,
              disabledForegroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.black12,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text,
                      textAlign: TextAlign.center,
                      style: AppTypography.buttonText20),
                ],
              ),
            ],
          ),
        ));
  }
}
