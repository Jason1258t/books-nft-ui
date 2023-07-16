import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/utils/gradients.dart';

class ConstIconsWithTextElevatedButton extends StatelessWidget {
  const ConstIconsWithTextElevatedButton(
      {super.key,
        required this.onTap,
        required this.text,
        this.width = 150,
        this.height = 36})
      : gradient = AppGradients.darkButton;

  final String text;
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
            border: Border.all(color: AppColors.darkBorder, width: 2),
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
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'Assets/icons/treangle_left.svg',
                        width: 16,
                      ),
                      const SizedBox(width: 4,),
                      Text(text, style: AppTypography.font10gold,),
                      const SizedBox(width: 4,),
                      SvgPicture.asset(
                        'Assets/icons/treangle_right.svg',
                        width: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
