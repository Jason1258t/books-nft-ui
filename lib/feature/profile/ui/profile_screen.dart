import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/data/app_repository.dart';
import 'package:nft/feature/auth/bloc/login/login_cubit.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/widget/custom_scaffold/scaffold.dart';

import '../../../bloc/app_cubit.dart';
import '../../../utils/dialogs.dart';
import '../../../utils/gradients.dart';
import '../../../widget/app_bar/app_bar.dart';
import '../../../widget/buttons/custom_elevated_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _showDialog(VoidCallback confirmCallback, String text) {
    double width = MediaQuery.of(context).size.width;

    Dialogs.show(
        context,
        AlertDialog(
          content: Container(
            height: 170,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: AppGradients.alertDialogBackground),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: AppTypography.font16white.copyWith(fontSize: 24),
                ),
                Row(
                  children: [
                    CustomElevatedButton(
                      text: 'No',
                      onTap: () {
                        Navigator.pop(context);
                      },
                      width: (width - 150) / 2,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    CustomElevatedButton(
                      text: 'Yes',
                      onTap: confirmCallback,
                      borderColor: AppColors.buttonDarkColor,
                      gradient: const LinearGradient(colors: [
                        AppColors.buttonDarkColor,
                        AppColors.buttonDarkColor
                      ]),
                      height: 50,
                      width: (width - 150) / 2,
                    ),
                  ],
                )
              ],
            ),
          ),
          contentPadding: const EdgeInsets.all(0),
        ));
  }

  void logoutShowDialog() => _showDialog(() {
        Navigator.pop(context);
        BlocProvider.of<LoginCubit>(context).logout();
      }, 'Log out?');

  void deleteShowDialog() => _showDialog(() {
        Navigator.pop(context);
        BlocProvider.of<LoginCubit>(context).deleteAccount();
      }, 'Delete account?');

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final appRepository = RepositoryProvider.of<AppRepository>(context);

    return BlocListener<AppCubit, AppState>(
      listener: (context, state) {
        if (state is AppUnAuthState) {
          Navigator.pop(context);
        }
      },
      child: CustomScaffold(
        appBar: CustomAppBar(
          width: width,
          height: height,
          context: context,
          isProfileButton: false,
        ),
        isButtonBack: true,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profile',
                style: AppTypography.font20white.copyWith(fontSize: 24),
              ),
              Column(
                children: [
                  CustomElevatedButton(
                    text: 'Log out',
                    onTap: logoutShowDialog,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomElevatedButton(
                    text: 'Delete account',
                    borderColor: AppColors.darkBorder,
                    onTap: deleteShowDialog,
                    gradient: AppGradients.redButton,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
