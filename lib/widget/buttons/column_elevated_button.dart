import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/gradients.dart';

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
            gradient: gradient),
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 5,
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(
                asset,
                width: 24,
              ),
              ShaderMask(
                shaderCallback: (Rect rect) =>
                    AppGradients.goldWhiteGr.createShader(rect),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFFFF1DE),
                    fontSize: 10,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
