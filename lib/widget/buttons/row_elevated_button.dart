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
      required this.asset,
      this.width = 150,
      this.height = 36})
      : gradient = AppGradients.darkButton;

  const RowElevatedButton.big({
    super.key,
    required this.asset,
    required this.text,
    required this.onTap,
  })  : width = double.infinity,
        height = 56,
        gradient = AppGradients.darkButton;

  final String text;
  final String asset;
  final Gradient gradient;
  final double? width;
  final double? height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.goldBorder, width: 2),
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
                  borderRadius: BorderRadius.circular(8)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
