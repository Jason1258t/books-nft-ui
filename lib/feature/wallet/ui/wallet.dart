import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/feature/home/data/homa_repository.dart';
import 'package:nft/utils/gradients.dart';
import 'package:nft/widget/bottom_sheet.dart';
import 'package:nft/widget/buttons/custom_elevated_button.dart';
import 'package:nft/widget/buttons/row_elevated_button.dart';

import '../../../utils/fonts.dart';
import '../../../widget/containers/token_container.dart';
import '../../../widget/text_field/dark_custom_field.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    String address = 'asf2a6sfFafG4gds6g4shHSd45s4hHHHH46';
    final repository = RepositoryProvider.of<HomeRepository>(context);

    void showWithdraw() {
      TextEditingController addressController = TextEditingController();
      TextEditingController amountController = TextEditingController();
      repository.showBottomSheet = true;
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: CustomBottomSheet(
                  title: 'Withdraw',
                  children: [
                    SvgPicture.asset(
                      'Assets/icons/clc.svg',
                      width: 64,
                    ),
                    DarkCustomTextField(
                      controller: addressController,
                      hintText: 'To address',
                    ),
                    DarkCustomTextField(
                      controller: amountController,
                      hintText: 'Amount',
                      keyBoardType: TextInputType.number,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Available: ',
                                    style: AppTypography.font12white),
                                TextSpan(
                                    text: '0.00',
                                    style: AppTypography.font12white
                                        .copyWith(fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text: ' USTD',
                                    style: AppTypography.font12white),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Gas: ',
                                    style: AppTypography.font12white),
                                TextSpan(
                                    text: '3.0',
                                    style: AppTypography.font12white
                                        .copyWith(fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text: ' Gwei',
                                    style: AppTypography.font12white),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    CustomElevatedButton(
                      text: 'Confirm',
                      onTap: () {},
                      gradient: AppGradients.lightButton,
                      borderColor: const Color(0xFF544043),
                    )
                  ],
                ),
          )).whenComplete(() => repository.showBottomSheet = false);
    }

    void showReceive() {
      repository.showBottomSheet = true;
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) =>
              CustomBottomSheet(title: 'Receive', children: [
                Container(
                  width: 196,
                  height: 196,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage("Assets/images/QRcode.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                Text(
                  'Scan address to receive payment $address ',
                  style: AppTypography.font12white,
                  textAlign: TextAlign.center,
                ),
                CustomElevatedButton(
                  text: 'Copy address',
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: address));
                    const snackBar = SnackBar(content: Text('Address copied'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  gradient: AppGradients.lightButton,
                  borderColor: const Color(0xFF544043),
                )
              ])).whenComplete(() => repository.showBottomSheet = false);
    }

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Wallet', style: AppTypography.font24w700Gilroy),
              RowElevatedButton(
                  text: 'Receive',
                  onTap: showReceive,
                  asset1: 'Assets/icons/receive.svg')
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, ind) => TokenContainer(
                        withdraw: showWithdraw,
                      ),
                  separatorBuilder: (context, ind) => const SizedBox(
                        height: 16,
                      ),
                  itemCount: 5)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: RowElevatedButton.big(
                asset1: 'Assets/icons/refresh.svg',
                text: 'Refresh',
                onTap: () {}),
          )
        ],
      ),
    ));
  }
}
