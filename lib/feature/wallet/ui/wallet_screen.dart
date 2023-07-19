import 'package:flutter/material.dart';
import 'package:nft/feature/wallet/ui/create_wallet.dart';
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

  void changeScreen(int index) => setState(() {
        currentScreen = index;
      });

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      CreateWallet(
        createWallet: () {
          changeScreen(1);
        },
        importWallet: () {
          Navigator.pushNamed(context, '/import_wallet_screen');
        },
      ),
      PINScreen(
        continueFunction: () {
          changeScreen(2);
        },
      ),
      Phrase(
        confirm: () {
          changeScreen(3);
        },
      ),
      PhraseConfirm(
        confirm: () {
          changeScreen(4);
        },
      ),
      const Wallet(),
    ];

    return screens[currentScreen];
  }
}
