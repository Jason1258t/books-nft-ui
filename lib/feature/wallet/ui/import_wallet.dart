import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';
import '../../../utils/gradients.dart';
import '../../../widget/buttons/custom_elevated_button.dart';
import '../../../widget/buttons/small_elevated_button.dart';
import '../../../widget/text_field/custom_text_field.dart';
import '../../../widget/text_field/text_field_with_button.dart';

class ImportWalletScreen extends StatefulWidget {
  const ImportWalletScreen({super.key});

  @override
  State<ImportWalletScreen> createState() => _ImportWalletScreenState();
}

class _ImportWalletScreenState extends State<ImportWalletScreen> {
  String codeState = "SEND CODE";
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bottomNavigationBackground,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('Assets/images/Background.png'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text('Import Wallet',
                        style: AppTypography.font24w700Gilroy),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Enter your Seed Phrase words, separate them with space.',
                      textAlign: TextAlign.center,
                      style: AppTypography.font12dark
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      controller: TextEditingController(),
                      height: 160,
                      hintText: 'Enter seed phrase',
                      maxLines: 10,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomTextFieldWithButton(
                      controller: codeController,
                      suffixIcon: SmallElevatedButton(
                        text: codeState,
                        onTap: () {
                          setState(() {
                            codeState = "VERIFY";
                          });
                        },
                        width: 120,
                        height: 32,
                      ),
                      hintText: 'Verification code',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: CustomElevatedButton(
                    text: 'Import wallet',
                    onTap: () {},
                    gradient: AppGradients.lightButton,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
