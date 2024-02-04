import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/feature/my_books/data/my_books_repository.dart';
import 'package:nft/models/stats.dart';
import 'package:nft/utils/fonts.dart';

import '../../utils/colors.dart';
import '../stats/stat.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(
      {super.key,
      required double width,
      required double height,
      required BuildContext context,
      bool isProfileButton = true})
      : super(
          automaticallyImplyLeading: false,
          elevation: 5,
          backgroundColor: AppColors.bottomNavigationBackground,
          title: StreamBuilder<UserStats>(
              initialData: UserStats(
                  lvl: 1, stats: Stats.zero(), indicators: Indicators(0, 0, 0, 0, 0)),
              stream: RepositoryProvider.of<MyBooksRepository>(context)
                  .userProperties
                  .stream,
              builder: (context, snapshot) {
                final indicators = snapshot.data!.indicators;
                final stats = snapshot.data!.stats;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserStat(
                      text: 'x${indicators.mixed}',
                      fill: 0,
                      asset: 'Assets/icons/Vector-2.svg',
                      width: (width - 39) * 0.19,
                      height: height * 0.03,
                    ),
                    UserStat(
                      text: '${stats.energy}/${stats.energy}',
                      fill: 1,
                      asset: 'Assets/icons/energy.svg',
                      width: (width - 39) * 0.19,
                      height: height * 0.03,
                    ),
                    UserStat(
                      text: '${indicators.strength}%',
                      fill: indicators.strength / 100,
                      asset: 'Assets/icons/shield.svg',
                      width: (width - 39) * 0.19,
                      height: height * 0.03,
                    ),
                    Container(
                      width: (width - 39) * 0.19,
                      height: height * 0.03,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.statColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 3,
                          ),
                          SvgPicture.asset('Assets/icons/stars.svg'),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            '2 430',
                            style: AppTypography.font14white
                                .copyWith(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (isProfileButton) {
                          Navigator.pushNamed(context, '/profile_screen');
                        }
                      },
                      child: Container(
                        width: (width - 39) * 0.19,
                        height: height * 0.03,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.statColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset('Assets/icons/profile.svg'),
                      ),
                    ),
                  ],
                );
              }),
        );
}
