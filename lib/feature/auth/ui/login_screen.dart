import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/feature/auth/bloc/login/login_cubit.dart';
import 'package:nft/utils/dialogs.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/widget/app_bar/empty_app_bar.dart';
import 'package:nft/widget/buttons/custom_elevated_button.dart';
import 'package:nft/widget/buttons/small_elevated_button.dart';
import 'package:nft/widget/text_field/custom_text_field.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../widget/buttons/elevated_button_with_check_box.dart';
import '../../../widget/text_field/text_field_with_button.dart';
import '../bloc/code/code_cubit.dart';

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
  bool isErrorAccept = false;

  bool isValidEmail = true;
  bool isVerificationCode = false;

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
            isVerificationCode = true;
            setState(() {});
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
        child: BlocConsumer<CodeCubit, CodeState>(
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
              isValidEmail = false;
              setState(() {});
            }
          },
          builder: (context, state) => Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: EmptyAppBar(
              context: context,
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
                        keyBoardType: TextInputType.phone,
                        onChange: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              isVerificationCode = false;
                            });
                          } else {
                            setState(() {
                              codeState = "SEND CODE";
                              isVerificationCode = true;
                            });
                          }
                        },
                        suffixIcon: SmallElevatedButton(
                          text: state is WaitState
                              ? state.remainingTime.toString()
                              : codeState,
                          onTap: () {
                            if (codeState == 'SEND CODE' &&
                                state is! WaitState) {
                              log('--------- trying to send step 1');
                              if (RegExp(emailRegExp)
                                  .hasMatch(emailController.text)) {
                                isValidEmail = true;

                                log('--------- trying to send step 2');
                                BlocProvider.of<CodeCubit>(context)
                                    .loginCode(emailController.text.trim());
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
                          text: 'SingIn',
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (isValidEmail &&
                                isTap &&
                                passwordController.text.isNotEmpty) {
                              BlocProvider.of<LoginCubit>(context).login(
                                  email: emailController.text.trim(),
                                  code: passwordController.text.trim());
                            }
                            isErrorAccept = !isTap;

                            setState(() {});
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButtonWithCheckBox(
                        text: 'I accept the user agreement',
                        isError: isErrorAccept,
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
