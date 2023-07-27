import 'package:flutter/material.dart';
import 'package:nft/utils/fonts.dart';

import '../../utils/colors.dart';

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
      child: Center(
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.goldBorder, width: 2),
                color: AppColors.buttonDarkColor),
            alignment: Alignment.center,
            child: ElevatedButton(
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
              onPressed: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: AppTypography.buttonText20.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
