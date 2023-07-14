// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';

import '../../utils/fonts.dart';

class DarkCustomTextField extends StatelessWidget {
  final double width;
  final double height;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final ValueChanged<String>? onChange;
  final String hintText;

  const DarkCustomTextField(
      {Key? key,
        required this.controller,
        this.width = double.infinity,
        this.height = 60,
        this.keyBoardType = TextInputType.text,
        this.onChange,
        this.hintText = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF4F483D)
      ),
      child: TextFormField(
        cursorColor: AppColors.cursorBackground,
        keyboardType: keyBoardType,
        maxLines: 1,
        onChanged: onChange ?? (value) {},
        style: const TextStyle(
          color: Color(0xFFB8B89C),
          fontSize: 20,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w700,
        ),
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFFA2A28C),
            fontSize: 20,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w700,
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.empty)
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.empty)
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.empty)
          ),
        ),
      ),
    );
  }
}
