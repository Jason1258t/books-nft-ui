import 'package:flutter/material.dart';
import 'package:nft/utils/gradients.dart';

import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';
import '../../../widget/buttons/custom_elevated_button.dart';
import '../../../widget/text_field/custom_text_field.dart';

class DescribeProblem extends StatelessWidget {
  const DescribeProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.bottomNavigationBackground,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15,)
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('Assets/images/Background.png'),
              fit: BoxFit.cover,
            )),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Privacy policy',
                          style: AppTypography.font16white,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Term of Use',
                          style: AppTypography.font16white,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Describe your problem',
                      style: AppTypography.font16white.copyWith(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextField(
                      controller: TextEditingController(),
                      height: 56,
                      hintText: 'Email',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      controller: TextEditingController(),
                      height: 160,
                      hintText: '*Describe your problem',
                      maxLines: 100,
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    CustomElevatedButton(
                        text: 'SEND REQUEST',
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/home_screen');
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
