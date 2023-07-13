import 'package:flutter/material.dart';
import 'package:nft/feature/wallet/ui/phrase.dart';
import 'package:nft/feature/wallet/ui/pincode.dart';
import 'package:nft/feature/wallet/ui/wallet.dart';

import 'confirm_phrase.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int currentScreen = 0;

  void changeScreen(int ind) => setState(() {
        currentScreen = ind;
      });

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Wallet(
        createWallet: () {
          changeScreen(1);
        },
        importWallet: () {},
      ),
      PincodeScreen(
        continueFunction: () {
          print('2 screen');
          changeScreen(2);
        },
      ),
      Phrase(confirm: () {changeScreen(3);},),
      PhraseConfirm(),
    ];

    return screens[currentScreen];
  }
}
