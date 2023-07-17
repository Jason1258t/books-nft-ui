import 'package:flutter/material.dart';
import 'package:nft/utils/gradients.dart';
import 'package:nft/widget/buttons/row_elevated_button.dart';

import '../../../widget/buttons/icon_elevated_button.dart';
import '../../../widget/buttons/icons_with_text_elevated_button.dart';
import '../../../widget/containers/lvl.dart';
import '../../../widget/containers/statistics.dart';
import '../../../widget/stats/stat.dart';
import '../../../widget/wardrobe/wardrobe.dart';

class WardrobeScreen extends StatefulWidget {
  const WardrobeScreen({super.key});

  @override
  State<WardrobeScreen> createState() => _WardrobeScreenState();
}

class _WardrobeScreenState extends State<WardrobeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        floatingActionButton: RowElevatedButton.big(
          width: MediaQuery.of(context).size.width - 40,
          text: 'Read',
          onTap: () {},
          asset1: 'Assets/icons/read.svg',
          gradient: AppGradients.wardrobeButtons,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/images/backgroundHome.png"),
                    fit: BoxFit.cover)),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SizedBox(
                                height: height * 0.2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const UserStat(
                                              text: 'x1.4',
                                              fill: 0,
                                              asset: 'Assets/icons/Vector-2.svg'),
                                          const Column(
                                            children: [
                                              StatisticsContainer(
                                                fill: 0.6,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              StatisticsContainer(
                                                fill: 0.4,
                                              ),
                                            ],
                                          ),
                                          ConstIconsWithTextElevatedButton(
                                            onTap: () {},
                                            text: 'Level Up',
                                            height: height * 0.03,
                                            width: (width - 40) * 0.3,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const UserStat(
                                              text: '3,3/5',
                                              fill: 3.3 / 5,
                                              asset: 'Assets/icons/energy.svg'),
                                          const Column(
                                            children: [
                                              StatisticsContainer(
                                                fill: 0.2,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              StatisticsContainer(
                                                fill: 1,
                                              ),
                                            ],
                                          ),
                                          IconElevatedButton(
                                            onTap: () {},
                                            asset1: 'Assets/icons/key.svg',
                                            height: height * 0.03,
                                            width: (width - 40) * 0.3,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const UserStat(
                                              text: '85%',
                                              fill: 0.85,
                                              asset: 'Assets/icons/shield.svg'),
                                          Container(
                                              padding: const EdgeInsets.fromLTRB(
                                                  10, 0, 20, 0),
                                              child: const LvlContainer()),
                                          ConstIconsWithTextElevatedButton(
                                            onTap: () {},
                                            text: 'Profile',
                                            height: height * 0.03,
                                            width: (width - 40) * 0.3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Wardrobe()
                    ]),
              ),
            )));
  }
}

