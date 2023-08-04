import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/utils/gradients.dart';
import 'package:nft/widget/app_bar/app_bar.dart';
import 'package:nft/widget/buttons/custom_elevated_button.dart';
import 'package:nft/widget/buttons/small_elevated_button.dart';
import 'package:nft/widget/containers/word_container.dart';
import 'package:nft/widget/custom_scaffold/custom_scaffold.dart';

import '../../../utils/fonts.dart';
import '../../../widget/text_field/text_field_with_button.dart';
import '../bloc/wallet_cubit.dart';

class PhraseConfirm extends StatefulWidget {
  const PhraseConfirm({super.key});

  @override
  State<PhraseConfirm> createState() => _PhraseConfirmState();
}

class _PhraseConfirmState extends State<PhraseConfirm> {
  TextEditingController codeController = TextEditingController();

  List<String> words = [
    'Skill',
    'Total',
    'oven',
    'head',
    'member',
    'forever',
    'lovers',
    'every',
    'level',
    'earth',
    'join',
    'movie',
  ];

  List<String> selectedWords = [];

  void selectWord(String word) {
    selectedWords.add(word);
    words.remove(word);
    setState(() {});
  }

  void removeWord(String word) {
    selectedWords.remove(word);
    words.add(word);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    void confirm() {
      BlocProvider.of<WalletCubit>(context).creteWallet();
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }

    return CustomScaffold(
      appBar: CustomAppBar(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        context: context,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text('Create Wallet', style: AppTypography.font24w700Gilroy),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Please choose Seed phrase in order and make sure your Seed phrase was written correctly. Once forgotten it cannot be recovered.',
                  textAlign: TextAlign.center,
                  style: AppTypography.font12dark,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                    constraints: const BoxConstraints(minHeight: 160),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const RadialGradient(
                          colors: [Color(0xff7C837E), Color(0xff647166)],
                          radius: 1),
                    ),
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: Wrap(
                      children: List.generate(
                          selectedWords.length,
                          (index) => WordContainer(
                              callback: () {
                                removeWord(selectedWords[index]);
                              },
                              text: selectedWords[index])),
                    )),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  constraints: const BoxConstraints(minHeight: 0),
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: List.generate(
                        words.length,
                        (index) => WordContainer(
                            callback: () {
                              selectWord(words[index]);
                            },
                            text: words[index])),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomTextFieldWithButton(
                  controller: codeController,
                  keyBoardType: TextInputType.phone,
                  suffixIcon: SmallElevatedButton(
                    text: 'SEND CODE',
                    onTap: () {},
                    width: 120,
                    height: 32,
                  ),
                  hintText: 'Verification code',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 90),
                  child: CustomElevatedButton(
                    text: 'Confirm',
                    onTap: confirm,
                    gradient: AppGradients.darkButton,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
