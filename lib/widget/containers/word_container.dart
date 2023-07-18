import 'package:flutter/material.dart';
import 'package:nft/utils/gradients.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: ShapeDecoration(
              gradient: AppGradients.darkButton,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF948B85)),
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0xA5000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Text(text),
          )),
    );
  }
}
