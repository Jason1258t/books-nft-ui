import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/widget/buttons/column_elevated_button.dart';

class TokenContainer extends StatelessWidget {
  const TokenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: ShapeDecoration(
        color: AppColors.buttonDarkColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipOval(
                child: SvgPicture.asset(
                  'Assets/icons/clc.svg',
                  width: 48,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CLC',
                    style: AppTypography.font20white,
                  ),
                  Text(
                    '0.0000025',
                    style: AppTypography.font12white,
                  )
                ],
              )
            ],
          ),
          ColumnElevatedButton(text: 'Withdraw', asset: 'Assets/icons/withdraw.svg', onTap: () {})
        ],
      ),
    );
  }
}
