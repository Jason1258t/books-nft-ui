import 'package:flutter/material.dart';
import 'package:nft/utils/fonts.dart';

import '../../utils/colors.dart';

class CustomToggleSwitch extends StatefulWidget {
  const CustomToggleSwitch({super.key});

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

List<bool> isSelected = [false, false];
int selectIndex = 0;

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderColor: AppColors.goldBorder,
      borderWidth: 2,
      borderRadius: BorderRadius.circular(10),
      selectedBorderColor: AppColors.goldBorder,
      isSelected: isSelected,
      splashColor: AppColors.isActiveSwitchToggle,
      onPressed: (int newIndex) {
        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            if (index == newIndex) {
              isSelected[index] = true;
              selectIndex = index;
              setState(() {});
            } else {
              isSelected[index] = false;
            }
          }
        });
      },
      children: [
        Container(
          width: 160,
          height: 55,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
              selectIndex == 0
                  ? const Color(0xffE1CFAB)
                  : AppColors.buttonLightColor,
              selectIndex == 0
                  ? AppColors.isActiveSwitchToggle
                  : AppColors.isNoActiveSwitchToggle,
            ], radius: 1, center: Alignment.topCenter),
          ),
          child: Text('Books',
              style: selectIndex == 0
                  ? AppTypography.font24goldShadow
                  : AppTypography.font24darkShadow),
        ),
        Container(
          width: 160,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
              selectIndex == 1
                  ? const Color(0xffE1CFAB)
                  : AppColors.buttonLightColor,
              selectIndex == 1
                  ? AppColors.isActiveSwitchToggle
                  : AppColors.isNoActiveSwitchToggle,
            ], radius: 1, center: Alignment.topCenter),
            color: selectIndex == 1
                ? AppColors.isActiveSwitchToggle
                : AppColors.isNoActiveSwitchToggle,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('Collections',
              style: selectIndex == 1
                  ? AppTypography.font24goldShadow
                  : AppTypography.font24darkShadow),
        ),
      ],
    );
  }
}

