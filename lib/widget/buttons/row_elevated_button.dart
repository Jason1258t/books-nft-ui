import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/utils/gradients.dart';

class RowElevatedButton extends StatelessWidget {
  const RowElevatedButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.asset});

  final String text;
  final String asset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 5,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.goldBorder, width: 2),
                borderRadius: BorderRadius.circular(8),
                gradient: const RadialGradient(colors: [
                  AppColors.buttonLightColor,
                  AppColors.buttonDarkColor,
                ], radius: 2, center: Alignment(0, -0.4))),
            alignment: Alignment.center,
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return AppGradients.goldWhiteGr.createShader(rect);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    asset,
                    width: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: AppTypography.buttonText20,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
