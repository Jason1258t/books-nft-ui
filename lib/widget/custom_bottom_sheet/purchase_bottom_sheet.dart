import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft/feature/my_books/bloc/purchase/purchase_cubit.dart';

import '../../utils/colors.dart';
import '../../utils/fonts.dart';
import '../buttons/custom_elevated_button.dart';
import 'bottom_sheet.dart';

class PurchaseBottomSheet extends StatefulWidget {
  const PurchaseBottomSheet(
      {super.key, required this.title, required this.purchaseCallback});

  final String title;
  final VoidCallback purchaseCallback;

  @override
  State<PurchaseBottomSheet> createState() => _PurchaseBottomSheetState();
}

class _PurchaseBottomSheetState extends State<PurchaseBottomSheet> {
  bool wait = true;

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      mainAxisAlignment: MainAxisAlignment.start,
      title: 'Purchase',
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    constraints: const BoxConstraints(minHeight: 60),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.backGroundTextShowButtonSheet),
                    alignment: Alignment.center,
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: AppTypography.font16white,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                      constraints: const BoxConstraints(minHeight: 60),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.backGroundTextShowButtonSheet),
                      alignment: Alignment.center,
                      child: wait
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                    'Assets/icons/black_stars.svg'),
                                Text('Free', style: AppTypography.font16white),
                              ],
                            )
                          : BlocBuilder<PurchaseCubit, PurchaseState>(
                              builder: (context, state) {
                                List<Widget> children = [];
                                if (state is PurchaseLoading) {
                                  children = [
                                    const CircleAvatar(
                                      radius: 25,
                                      backgroundColor:
                                          AppColors.cursorBackground,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  ];
                                } else if (state is PurchaseSuccess) {
                                  children = [
                                    SvgPicture.asset(
                                        'Assets/icons/check_mark.svg'),
                                    Text('Successfully',
                                        style: AppTypography.font16white),
                                  ];
                                } else if (state is PurchaseFail) {
                                  children = [
                                    SvgPicture.asset(
                                        'Assets/icons/red_delete.svg'),
                                    Text('Error',
                                        style: AppTypography.font16white),
                                  ];
                                }

                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: children,
                                );
                              },
                            )),
                ],
              ),
              CustomElevatedButton(
                  text: 'Confirm purchase',
                  onTap: () {
                    widget.purchaseCallback();
                    setState(() {
                      wait = false;
                    });
                  }),
            ],
          ),
        )
      ],
    );
  }
}
