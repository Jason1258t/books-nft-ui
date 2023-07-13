import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';

import '../check_box/custom_check_box.dart';

class ElevatedButtonWithCheckBox extends StatefulWidget {
  const ElevatedButtonWithCheckBox(
      {super.key,
      required this.text,
      required this.onTap,
      this.width,
      required this.style,
      required this.isTap});

  final String text;
  final VoidCallback onTap;
  final double? width;
  final TextStyle style;
  final bool isTap;

  @override
  State<ElevatedButtonWithCheckBox> createState() =>
      _ElevatedButtonWithCheckBoxState();
}

class _ElevatedButtonWithCheckBoxState
    extends State<ElevatedButtonWithCheckBox> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.textFieldBackground,
        elevation: 5,
        child: Container(
            width: widget.width ?? double.infinity,
            height: 56,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.textFieldBackground),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomCheckBox(
                  isSelect: widget.isTap,
                ),
                Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: widget.style,
                ),
                SizedBox(
                  width: 24,
                ),
              ],
            )),
      ),
    );
  }
}
