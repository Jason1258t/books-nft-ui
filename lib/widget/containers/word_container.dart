import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';

class WordContainer extends StatelessWidget {
  const WordContainer({super.key, required this.callback, required this.text});

  final VoidCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: InkWell(
          onTap: callback,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            decoration: ShapeDecoration(
              color: AppColors.buttonDarkColor,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: AppColors.goldBorder),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(text, style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.goldBorder),),
          )),
    );
  }
}
