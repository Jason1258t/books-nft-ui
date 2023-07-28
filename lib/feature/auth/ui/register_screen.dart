import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/feature/auth/bloc/code/code_cubit.dart';
import 'package:nft/feature/auth/bloc/login/login_cubit.dart';
import 'package:nft/utils/constants.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/widget/buttons/custom_elevated_button.dart';
import 'package:nft/widget/buttons/small_elevated_button.dart';
import 'package:nft/widget/text_field/custom_text_field.dart';

import '../../../utils/colors.dart';
import '../../../utils/dialogs.dart';
import '../../../widget/buttons/elevated_button_with_check_box.dart';
import '../../../widget/text_field/text_field_with_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String codeState = "SEND CODE";

  bool isValidEmail = true;
  bool isVerificationCode = false;

  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) Navigator.pop(context);
          if (state is LoginFailState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('login fail')));
          }
          if (state is LoginLoadingState) {
            Dialogs.showModal(
                context,
                const Center(
                  child: CircularProgressIndicator(),
                ));
          } else {
            Dialogs.hide(context);
          }
        },
        child: BlocListener<CodeCubit, CodeState>(
          listener: (context, state) {
            if (state is SendingState) {
              Dialogs.showModal(
                  context,
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                    ),
                  ));
            } else {
              Dialogs.hide(context);
            }

            if (state is SentState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('code sent')));
            }
            if (state is FailState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('fail')));
            }
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
                  const SizedBox(
                    height: 20,
                  )
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
                        isError: !isValidEmail,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFieldWithButton(
                        controller: passwordController,
                        height: 56,
                        obscureText: true,
                        maxLength: 18,
                        isError: isVerificationCode,
                        hintText: 'Verification code',
                        onChange: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              codeState = "VERIFY";
                            });
                          } else {
                            setState(() {
                              codeState = "SEND CODE";
                            });
                          }
                        },
                        suffixIcon: SmallElevatedButton(
                          text: codeState,
                          onTap: () {
                            if (codeState == 'SEND CODE') {
                              log('--------- trying to send step 1');
                              if (RegExp(emailRegExp)
                                  .hasMatch(emailController.text)) {
                                isValidEmail = true;

                                log('--------- trying to send step 2');
                                BlocProvider.of<CodeCubit>(context)
                                    .signupCode(emailController.text.trim());
                              } else {
                                isValidEmail = false;
                              }

                              setState(() {});
                            }
                          },
                          height: 32,
                          width: 120,
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Text(
                              'i can’t get it',
                              style: AppTypography.font14white,
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/describe_problem_screen');
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomElevatedButton(
                          text: 'REGISTER',
                          onTap: () {
                            BlocProvider.of<LoginCubit>(context).login(
                                email: emailController.text.trim(),
                                code: passwordController.text.trim());
                            // Navigator.pushReplacementNamed(context, '/home_screen');
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButtonWithCheckBox(
                        text: 'I accept the user agreement',
                        style: isTap
                            ? AppTypography.font14white.copyWith(fontSize: 16)
                            : AppTypography.font14white.copyWith(
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
        ),
      ),
    );
  }
}
