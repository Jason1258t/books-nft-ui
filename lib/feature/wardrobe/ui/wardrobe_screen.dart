import 'package:flutter/material.dart';

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
          fit: BoxFit.cover
        )
      ),
      child: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserStat(
                          text: 'x1.4',
                          fill: 0,
                          asset: 'Assets/icons/Vector-2.svg'),
                      UserStat(
                          text: '3,3/5',
                          fill: 3.3 / 5,
                          asset: 'Assets/icons/energy.svg'),
                      UserStat(
                          text: '85%',
                          fill: 0.85,
                          asset: 'Assets/icons/shield.svg'),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          StatisticsContainer(),
                          StatisticsContainer(),
                        ],
                      ),
                      Column(
                        children: [
                          StatisticsContainer(),
                          StatisticsContainer(),
                        ],
                      ),
                      SizedBox(width: 86, height: 56,)
                    ],
                  ),
                ],
              ),
            ),
            // Container(
            //   width: width,
            //   height: height * 0.72,
            //   decoration: const BoxDecoration(
            //       image: DecorationImage(
            //     image: AssetImage('Assets/images/wardrobe.png'),
            //     fit: BoxFit.fill,
            //   )),
            // )
          ],
        ),
      ),
    ));
  }
}
