import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/fonts.dart';

import '../../utils/colors.dart';

class StatisticsContainer extends StatelessWidget {
  const StatisticsContainer(
      {super.key, required this.fill, required this.icon, required this.text});

  final double fill;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(text, style: AppTypography.font9brown),
        Container(
          width: (width - 40) * 0.31,
          height: height * 0.031,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/images/backgroundStatisctic.png"),
                fit: BoxFit.fill),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.01,
              ),
              SizedBox(
                  width: 18,
                  height: 18,
                  child: SvgPicture.asset(
                    icon,
                  )),
              SizedBox(
                width: width * 0.028,
              ),
              Container(
                width: fill * (width - 40 - width * 0.04) * 0.211,
                height: width * 0.01,
                alignment: Alignment.centerLeft,
                constraints: BoxConstraints(
                    maxWidth: (width - 40 - width * 0.04) * 0.211),
                decoration: BoxDecoration(
                    color: AppColors.statistic,
                    borderRadius: BorderRadius.circular(3)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
