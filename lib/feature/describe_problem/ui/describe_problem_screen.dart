import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';
import '../../../widget/buttons/custom_elevated_button.dart';
import '../../../widget/text_field/custom_text_field.dart';

class DescribeProblem extends StatelessWidget {
  const DescribeProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.bottomNavigationBackground,
          flexibleSpace: Container(
            height: 64,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFF796C5B), Color(0xFF92836F)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x8C000000),
                  blurRadius: 20,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
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
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        body: Container(
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
                        style: AppTypography.font20whiteShadow,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Term of Use',
                        style: AppTypography.font20whiteShadow,
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
                    style: AppTypography.font16white,
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
    );
  }
}
