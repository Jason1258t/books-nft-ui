import 'package:flutter/material.dart';
import 'package:nft/widget/buttons/custom_elevated_button.dart';
import 'package:nft/widget/containers/word_container.dart';

import '../../../utils/fonts.dart';

class PhraseConfirm extends StatefulWidget {
  PhraseConfirm({super.key});

  @override
  State<PhraseConfirm> createState() => _PhraseConfirmState();
}

class _PhraseConfirmState extends State<PhraseConfirm> {
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x72000000),
                              blurRadius: 6,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ]),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 100),
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
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 32),
                child: CustomElevatedButton(text: 'Confirm', onTap: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
