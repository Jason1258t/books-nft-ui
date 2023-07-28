import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft/widget/custom_scaffold/scaffold.dart';

import '../../../utils/fonts.dart';
import '../../../widget/app_bar/app_bar.dart';

class SecondBookInfoScreen extends StatelessWidget {
  const SecondBookInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return CustomScaffold(
      appBar: AppBars(
        width: width,
        height: height,
      ),
      isButtonBack: true,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Text(
            'Das Kapital. Kritik der politischen...',
            style: AppTypography.font20white.copyWith(fontSize: 24),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          const SizedBox(
            height: 15,
          ),
          Text('DESCRIPTION',
              style: AppTypography.font10black.copyWith(fontSize: 24)),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Главный труд немецкого философа и экономиста Карла Маркса по политической экономии, содержащий критический анализ капитализма. Работа написана с применением диалектико материалистического подхода, в том числе к историческим процессам.',
            style: AppTypography.font10blackW400.copyWith(fontSize: 12),
          ),
          const SizedBox(
            height: 15,
          ),
          Text('DETAILS',
              style: AppTypography.font10black.copyWith(fontSize: 24)),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'ISBN: 15wd1a645dw5a12s1d85a4w52d1f5aw \nДата публикации: 1867 \nЯзык: Немецкий \nЖанр: политическая экономика \nКоличество страниц: 500',
                style: AppTypography.font10blackW400
                    .copyWith(fontSize: 12, height: 2),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
