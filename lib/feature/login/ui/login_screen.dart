import 'package:flutter/material.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/utils/gradients.dart';
import 'package:nft/widget/buttons/custom_elevated_button.dart';
import 'package:nft/widget/buttons/small_elevated_button.dart';
import 'package:nft/widget/text_field/custom_text_field.dart';

import '../../../utils/colors.dart';
import '../../../widget/buttons/elevated_button_with_check_box.dart';
import '../../../widget/text_field/text_field_with_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String codeState = "SEND CODE";

  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.bottomNavigationBackground,
          automaticallyImplyLeading: false,
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
              const SizedBox(height: 20,)
            ],
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
                    'Enter your email address and a verification code',
                    style: AppTypography.font16white.copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    controller: emailController,
                    height: 56,
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFieldWithButton(
                    controller: passwordController,
                    height: 56,
                    obscureText: true,
                    maxLength: 18,
                    hintText: 'Verification code',
                    suffixIcon: SmallElevatedButton(
                      text: codeState,
                      onTap: () {
                        setState(() {
                          codeState = "VERIFY";
                        });
                      },
                      height: 32,
                      width: 120,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Text(
                          'i can’t get it',
                          style: AppTypography.font14whiteShadow,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/describe_problem_screen');
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  CustomElevatedButton(
                      text: 'LOGIN',
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/home_screen');
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButtonWithCheckBox(
                    text: 'I accept the user agreement',
                    style: isTap
                        ? AppTypography.font14whiteShadow.copyWith(fontSize: 16)
                        : AppTypography.font14whiteShadow.copyWith(
                            fontSize: 16, color: AppColors.isNotSelectText),
                    onTap: () {
                      setState(() {
                        isTap = !isTap;
                      });
                    },
                    isTap: isTap,
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
