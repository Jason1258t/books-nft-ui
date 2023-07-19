import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/fonts.dart';

import '../../utils/colors.dart';
import '../stats/stat.dart';

class AppBars extends AppBar {
  AppBars({super.key, required double width, required double height})
      : super(
    automaticallyImplyLeading: false,
    elevation: 5,
    backgroundColor: AppColors.bottomNavigationBackground,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UserStat(
          text: 'x1.4',
          fill: 0,
          asset: 'Assets/icons/Vector-2.svg',
          width: (width - 40) * 0.18,
          height: height * 0.03,
        ),
        UserStat(
          text: '3,3/5',
          fill: 3.3 / 5,
          asset: 'Assets/icons/energy.svg',
          width: (width - 40) * 0.18,
          height: height * 0.03,
        ),
        UserStat(
          text: '85%',
          fill: 0.85,
          asset: 'Assets/icons/shield.svg',
          width: (width - 40) * 0.18,
          height: height * 0.03,
        ),
        Container(
          width: (width - 40) * 0.18,
          height: height * 0.03,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.statColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const SizedBox(width: 3,),
              SvgPicture.asset('Assets/icons/stars.svg'),
              const SizedBox(width: 3,),
              Text('2 430', style: AppTypography.font14white.copyWith(fontSize: 12),)
            ],
          ),
        ),
        Container(
          width: (width - 40) * 0.18,
          height: height * 0.03,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.statColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('Assets/icons/profile.svg'),
            ],
          ),
        ),
      ],
    ),
  );
}
