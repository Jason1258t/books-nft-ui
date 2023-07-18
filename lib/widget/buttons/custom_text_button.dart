import 'package:flutter/material.dart';
import 'package:nft/utils/fonts.dart';

import '../../utils/gradients.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: InkWell(
        onTap: onTap,
        child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppTypography.buttonText20
        ),
      ),
    );
  }
}
