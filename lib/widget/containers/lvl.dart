import 'package:flutter/material.dart';
import 'package:nft/utils/fonts.dart';

import '../../utils/colors.dart';

class LvlContainer extends StatelessWidget {
  const LvlContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.lvlBackground,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColors.lvlBorder, width: 3)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('12', style: AppTypography.font24blue,),
          Text('Level', style: AppTypography.font24blue.copyWith(fontSize: 12),),
        ],
      ),
    );
  }
}
