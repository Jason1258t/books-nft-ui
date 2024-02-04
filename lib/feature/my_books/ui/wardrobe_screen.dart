import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/feature/my_books/data/my_books_repository.dart';
import 'package:nft/models/stats.dart';

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
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/images/backgroundHome.png"),
                    fit: BoxFit.cover)),
            child: SafeArea(
              child: Wrap(spacing: double.infinity, children: [
                Stack(
                  children: [
                    Container(
                      height: height * 0.21,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'Assets/images/Energy.png',
                            width: 270,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 17),
                      child: SizedBox(
                        height: height * 0.17,
                        child: StreamBuilder<UserStats>(
                            stream: RepositoryProvider.of<MyBooksRepository>(
                                    context)
                                .userProperties
                                .stream,
                            initialData: UserStats(
                                lvl: 1,
                                stats: Stats.zero(),
                                indicators: Indicators(0, 0, 0, 0, 0)),
                            builder: (context, snapshot) {
                              final stats = snapshot.data!.stats;
                              final indicators = snapshot.data!.indicators;
                              final lvl = snapshot.data!.lvl;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        UserStat(
                                          text: 'x${indicators.mixed}',
                                          fill: 0,
                                          asset: 'Assets/icons/Vector-2.svg',
                                          width: (width - 40) * 0.3,
                                          height: height * 0.03,
                                        ),
                                        Column(
                                          children: [
                                            StatisticsContainer(
                                              fill: stats.intelligence / 253,
                                              text:
                                                  '${stats.intelligence} Intelligence',
                                              icon:
                                                  'Assets/icons/blue_brain.svg',
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            StatisticsContainer(
                                              fill: stats.strength / 253,
                                              text:
                                                  '${stats.strength} Derability',
                                              icon:
                                                  'Assets/icons/blue_shied.svg',
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
                                        UserStat(
                                          text:
                                              '${indicators.current_energybar}/${indicators.total_energybar}',
                                          fill: indicators.current_energybar /
                                              indicators.total_energybar,
                                          asset: 'Assets/icons/energy.svg',
                                          width: (width - 40) * 0.3,
                                          height: height * 0.03,
                                        ),
                                        Column(
                                          children: [
                                            StatisticsContainer(
                                              fill: stats.energy / 253,
                                              text: '${stats.energy} Energy',
                                              icon:
                                                  'Assets/icons/blue_lightning.svg',
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            StatisticsContainer(
                                              fill: stats.luck / 253,
                                              text: '${stats.luck} Luck',
                                              icon:
                                                  'Assets/icons/blue_clever.svg',
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        UserStat(
                                          text: '${indicators.strength}%',
                                          fill: indicators.strength / 100,
                                          asset: 'Assets/icons/shield.svg',
                                          width: (width - 40) * 0.3,
                                          height: height * 0.03,
                                        ),
                                        LvlContainer(lvl: lvl),
                                        ConstIconsWithTextElevatedButton(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/profile_screen');
                                          },
                                          text: 'Profile',
                                          height: height * 0.03,
                                          width: (width - 40) * 0.3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                ),
                const Wardrobe()
              ]),
            )));
  }
}
