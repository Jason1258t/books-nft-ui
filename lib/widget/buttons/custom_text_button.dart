import 'package:flutter/material.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/utils/gradients.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: InkWell(
        onTap: onTap,
        child: ShaderMask(
          shaderCallback: (Rect rect){
            return AppGradients.goldWhiteGr.createShader(rect);
          },
          child: Text(
              text,
              textAlign: TextAlign.center,
              style: AppTypography.buttonText
          ),
        ),
      ),
    );
  }
}
