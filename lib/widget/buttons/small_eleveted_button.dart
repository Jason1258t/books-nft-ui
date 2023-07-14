import 'package:flutter/material.dart';
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
      child: Stack(children: [
        Center(
          child: Container(
            width: width + 8,
            height: height + 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: AppGradients.smallButtonBorder),
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
                    gradient: AppGradients.smallButtonBackground),
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
                  onPressed: () {  },
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
        ),
      ]),
    );
  }
}
