import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';

import '../../../utils/fonts.dart';
import '../../../utils/gradients.dart';
import '../../../widget/buttons/custom_elevated_button.dart';
import '../../../widget/scaffold.dart';

// ignore: must_be_immutable
class Phrase extends StatelessWidget {
  Phrase({super.key});

  List<String> words = [
    'Skill',
    'Total',
    'oven',
    'head',
    'member',
    'forever',
    'lovers',
    'every',
    'level',
    'earth',
    'join',
    'movie',
  ];

  @override
  Widget build(BuildContext context) {
    void confirm() =>
        Navigator.pushNamed(context, '/confirm_phrase_screen');

    return CustomScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text('Create Wallet', style: AppTypography.font24w700Gilroy),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Don’t risk losing your funds. Protect your Wallets by saving your Seed Phrase in a plase you trust.',
                      textAlign: TextAlign.center,
                      style: AppTypography.font12dark,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                        'It’s the only way to recover your Wallet if you get locked our of the App or change to a new device.',
                        textAlign: TextAlign.center,
                        style: AppTypography.font12dark
                            .copyWith(color: AppColors.redText)),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const RadialGradient(
                              colors: [Color(0xff7C837E), Color(0xff647166)],
                              radius: 1),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x72000000),
                              blurRadius: 6,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ]),
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            words.length,
                            (index) => Text('$index. ${words[index]}',
                                style: AppTypography.font20w800),
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 32),
                  child: CustomElevatedButton(
                    text: 'Confirm',
                    onTap: confirm,
                    gradient: AppGradients.darkButton,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
