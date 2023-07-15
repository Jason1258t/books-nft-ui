import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/fonts.dart';

import '../../utils/colors.dart';

class StatisticsContainer extends StatelessWidget {
  const StatisticsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('13 Intelligence', style: AppTypography.font16white.copyWith(fontSize: 9),),
        Container(
          width: 86,
          height: 20,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "Assets/images/backgroundStatisctic.png"
              ),
              fit: BoxFit.cover
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 2,),
              SvgPicture.asset('Assets/icons/blue_brain.svg'),
              const SizedBox(width: 7,),
              Container(
                width: 0.8 * 57,
                height: 4,
                alignment: Alignment.centerLeft,
                constraints: const BoxConstraints(
                  maxWidth: 57
                ),
                decoration: BoxDecoration(
                  color: AppColors.statistic,
                  borderRadius: BorderRadius.circular(3)
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
