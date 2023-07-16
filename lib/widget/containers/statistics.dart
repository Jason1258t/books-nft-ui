import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/fonts.dart';

import '../../utils/colors.dart';

class StatisticsContainer extends StatelessWidget {
  const StatisticsContainer({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('13 Intelligence', style: AppTypography.font16white.copyWith(fontSize: 9),),
        Container(
          width: (width - 40) * 0.31,
          height: height * 0.031,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "Assets/images/backgroundStatisctic.png"
              ),
              fit: BoxFit.fill
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: width * 0.01,),
              SvgPicture.asset('Assets/icons/blue_brain.svg'),
              SizedBox(width: width * 0.03,),
              Container(
                width: fill * (width - 40 - width * 0.04) * 0.211,
                height: width * 0.01,
                alignment: Alignment.centerLeft,
                constraints: BoxConstraints(
                  maxWidth: (width - 40 - width * 0.04) * 0.211
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
