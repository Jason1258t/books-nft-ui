import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/utils/gradients.dart';

class SmallElevatedButton extends StatelessWidget {
  const SmallElevatedButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.height,
      required this.width});

  final String text;
  final VoidCallback onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: InkWell(
        splashColor: AppColors.empty,
        onTap: onTap,
        child: Stack(children: [
          Center(
            child: Container(
              width: width + 8,
              height: height + 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.8, 1],
                    colors: [
                      AppColors.smallEvButtonBorderDark,
                      AppColors.smallEvButtonBorderLight,
                    ],
                  )),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.smallEvButtonBackgroundLight,
                          AppColors.smallEvButtonBackgroundDark,
                        ],
                      )),
                  alignment: Alignment.center,
                  child: ShaderMask(
                    shaderCallback: (Rect rect) {
                      return AppGradients.goldWhiteGr.createShader(rect);
                    },
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: AppTypography.font16white,
                    ),
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
