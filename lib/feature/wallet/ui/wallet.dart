import 'package:flutter/material.dart';
import 'package:nft/widget/buttons/row_elevated_button.dart';

import '../../../utils/fonts.dart';
import '../../../widget/containers/token_container.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Wallet', style: AppTypography.font24w700Gilroy),
              RowElevatedButton(
                  text: 'Receive',
                  onTap: () {},
                  asset: 'Assets/icons/receive.svg')
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, ind) => const TokenContainer(),
                  separatorBuilder: (context, ind) => const SizedBox(
                        height: 16,
                      ),
                  itemCount: 5))
        ],
      ),
    ));
  }
}
