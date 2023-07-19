import 'package:flutter/material.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/widget/buttons/custom_elevated_button.dart';

class CreateWallet extends StatelessWidget {
  const CreateWallet(
      {super.key});

  @override
  Widget build(BuildContext context) {
    void createWallet() =>
        Navigator.pushNamed(context, '/PIN_screen');

    void importWallet() =>
        Navigator.pushNamed(context, '/import_wallet_screen');

    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text('Wallet', style: AppTypography.font24w700Gilroy),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomElevatedButton(
                      text: 'Create new wallet',
                      onTap: createWallet,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomElevatedButton(
                      text: 'Import wallet by secret phrase',
                      onTap: importWallet,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}
