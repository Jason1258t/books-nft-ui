import 'package:flutter/material.dart';

import '../../../widget/buttons/icon_elevated_button.dart';
import '../../../widget/buttons/icons_with_text_elevated_button.dart';
import '../../../widget/containers/lvl.dart';
import '../../../widget/containers/statistics.dart';
import '../../../widget/stats/stat.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const UserStat(
                              text: 'x1.4',
                              fill: 0,
                              asset: 'Assets/icons/Vector-2.svg'),
                          const SizedBox(height: 18,),
                          const Column(
                            children: [
                              StatisticsContainer(),
                              SizedBox(height: 5,),
                              StatisticsContainer(),
                            ],
                          ),
                          const SizedBox(height: 12,),
                          ConstIconsWithTextElevatedButton(
                            onTap: () {},
                            text: 'Level Up',
                            height: 26,
                            width: 86,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const UserStat(
                              text: '3,3/5',
                              fill: 3.3 / 5,
                              asset: 'Assets/icons/energy.svg'),
                          const SizedBox(height: 18,),
                          const Column(
                            children: [
                              StatisticsContainer(),
                              SizedBox(height: 5,),
                              StatisticsContainer(),
                            ],
                          ),
                          const SizedBox(height: 12,),
                          IconElevatedButton(
                            onTap: () {},
                            asset1: 'Assets/icons/key.svg',
                            height: 26,
                            width: 86,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const UserStat(
                              text: '85%',
                              fill: 0.85,
                              asset: 'Assets/icons/shield.svg'),
                          const SizedBox(height: 18,),
                          Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                              child: const LvlContainer()),
                          const SizedBox(height: 22,),
                          ConstIconsWithTextElevatedButton(
                            onTap: () {},
                            text: 'Level Up',
                            height: 26,
                            width: 86,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
