import 'package:flutter/material.dart';
import 'package:nft/widget/buttons/text_button.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Wallet',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(text: 'Create new wallet', onTap: () {}),
                  const SizedBox(height: 32,),
                  CustomButton(text: 'Import wallet by secret phrase', onTap: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
