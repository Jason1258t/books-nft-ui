import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/feature/wallet/bloc/wallet_cubit.dart';
import 'package:nft/feature/wallet/ui/create_wallet.dart';
import 'package:nft/feature/wallet/ui/wallet.dart';

import 'confirm_phrase.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(builder: (context, state) {
      if (state is HasWallet) {
        return const Wallet();
      } else {
        return const CreateWallet();
      }
    });
  }
}
