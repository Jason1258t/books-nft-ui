import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.isSelect});

  final bool isSelect;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderCheckBox),
          color: AppColors.borderBackground,
        ),
        child: widget.isSelect ? SvgPicture.asset('Assets/icons/tick.svg',) :  Container(),
      ),
    );
  }
}
