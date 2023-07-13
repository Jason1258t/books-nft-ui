// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';

import '../../utils/fonts.dart';

class CustomTextFieldWithButton extends StatelessWidget {
  final double width;
  final double height;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final bool obscureText;
  final int maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChange;
  final String icon;
  final Widget suffixIcon;
  final String hintText;

  const CustomTextFieldWithButton(
      {Key? key,
      required this.controller,
      required this.suffixIcon,
      this.width = double.infinity,
      this.height = 56,
      this.obscureText = false,
      this.maxLines = 1,
      this.maxLength,
      this.keyBoardType = TextInputType.text,
      this.onChange,
      this.icon = "",
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.textFieldBackground,
      elevation: 10,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          obscuringCharacter: '*',
          obscureText: true,
          cursorColor: AppColors.cursorBackground,
          maxLines: maxLines,
          maxLength: maxLength,
          onChanged: onChange ?? (value) {},
          style: AppTypography.font20gold,
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          decoration: InputDecoration(
            counterText: '',
            hintText: hintText,
            hintStyle: AppTypography.font16dirtyGold,
            suffixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                suffixIcon,
              ],
            ),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.empty)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.empty)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.empty)),
          ),
        ),
      ),
    );
  }
}
