import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft/feature/home/data/homa_repository.dart';
import 'package:nft/feature/my_books/bloc/purchase/purchase_cubit.dart';

import '../../utils/colors.dart';
import '../../utils/fonts.dart';
import '../buttons/custom_elevated_button.dart';
import 'bottom_sheet.dart';

class PurchaseBottomSheet extends StatefulWidget {
  const PurchaseBottomSheet(
      {super.key,
        required this.title,
        required this.purchaseCallback,
        this.exitAction,
        this.needTitleField = false});

  final String title;
  final VoidCallback purchaseCallback;
  final VoidCallback? exitAction;
  final bool needTitleField;

  @override
  State<PurchaseBottomSheet> createState() => _PurchaseBottomSheetState();
}

class _PurchaseBottomSheetState extends State<PurchaseBottomSheet> {
  bool wait = true;
  bool inProcess = false;
  List<Widget> children = [];
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween;

  String buttonTitle = 'Confirm purchase';

  @override
  Widget build(BuildContext context) {
    VoidCallback buttonCallback = () {
      widget.purchaseCallback();
      setState(() {
        wait = false;
      });
    };

    return BlocConsumer<PurchaseCubit, PurchaseState>(
      listener: (context, state) {
        inProcess = state is PurchaseLoading;

        if (state is PurchaseLoading) {
          mainAxisAlignment = MainAxisAlignment.center;
          buttonTitle = 'Wait...';
          buttonCallback = () {};
          children = [
            const CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.cursorBackground,
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              ),
            )
          ];
        } else if (state is PurchaseSuccess) {
          mainAxisAlignment = MainAxisAlignment.spaceBetween;
          buttonTitle = 'Done';
          buttonCallback = widget.exitAction ?? () {
            Navigator.pop(context);
          };
          children = [
            SvgPicture.asset('Assets/icons/check_mark.svg'),
            Text('Successfully', style: AppTypography.font16white),
          ];
        } else if (state is PurchaseFail) {
          mainAxisAlignment = MainAxisAlignment.spaceBetween;
          buttonTitle = 'Go back';
          buttonCallback = () {
            Navigator.pop(context);
          };
          children = [
            SvgPicture.asset('Assets/icons/red_delete.svg'),
            Text('Error', style: AppTypography.font16white),
          ];
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async => !inProcess,
          child: CustomBottomSheet(
            mainAxisAlignment: MainAxisAlignment.start,
            title: 'Purchase',
            canBack: !inProcess,
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
                        if (widget.needTitleField) ...[
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
                        ],
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
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                        'Assets/icons/black_stars.svg'),
                                    if (!widget.needTitleField) ...[
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        widget.title,
                                        textAlign: TextAlign.center,
                                        style: AppTypography.font16white,
                                      ),
                                    ]
                                  ],
                                ),
                                Text('Free',
                                    style: AppTypography.font16white),
                              ],
                            )
                                : Row(
                              mainAxisAlignment: mainAxisAlignment,
                              children: children,
                            )),
                      ],
                    ),
                    CustomElevatedButton(
                        text: buttonTitle, onTap: buttonCallback),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
