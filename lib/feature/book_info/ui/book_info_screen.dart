import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/widget/custom_scaffold/scaffold.dart';

import '../../../utils/gradients.dart';
import '../../../widget/app_bar/app_bar.dart';
import '../../../widget/buttons/custom_elevated_button.dart';

class BookInfoScreen extends StatefulWidget {
  const BookInfoScreen({super.key});

  @override
  State<BookInfoScreen> createState() => _BookInfoScreenState();
}

class _BookInfoScreenState extends State<BookInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isButtonBack: true,
      appBar: AppBars(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Das Kapital. Kritik der politischen...',
                style: AppTypography.font20white.copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'Assets/images/grandpa.png',
                    width: 168,
                    height: 225,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 21),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('GOLDEN BOOK', style: AppTypography.font10black),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 256,
                            child: Text(
                                'Das Kapital. Kritik der politischen Ökonomie',
                                style: AppTypography.font10black)),
                        const SizedBox(
                          height: 4,
                        ),
                        const _TextAndDescription(
                          name: 'Author',
                          description: 'Karl Marx',
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const _TextAndDescription(
                          name: 'Creato',
                          description: 'Sereja',
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const _TextAndDescription(
                          name: 'Колличество активностей',
                          description: '8-16',
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const _TextAndDescription(
                            name: 'Возможный доход', description: '10-52,'),
                        const SizedBox(
                          height: 4,
                        ),
                        const _TextAndDescription(
                          name: 'Колличество изображений:',
                          description: '13/16',
                        ),
                      ],

                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('Assets/icons/brain.svg'),
                  SvgPicture.asset('Assets/icons/shield_with_background.svg'),
                  SvgPicture.asset('Assets/icons/lightning.svg'),
                  SvgPicture.asset('Assets/icons/clever.svg'),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomElevatedButton(
                text: 'Read',
                onTap: () {},
                gradient: AppGradients.lightButton,
              ),
              const SizedBox(
                height: 16,
              ),
              Text('DESCRIPTION',
                  style: AppTypography.font10black.copyWith(fontSize: 24)),
              Text(
                  'Главный труд немецкого философа и экономиста Карла Маркса по политической экономии, содержащий критический анализ капитализма. Работа написана с применением диалектико материалистического подхода, в том числе к историческим процессам.',
                  style: AppTypography.font10blackW400.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 15,),
              Text('DETAILS',
                  style: AppTypography.font10black.copyWith(fontSize: 24)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'ISBN: 15wd1a645dw5a12s1d85a4w52d1f5aw \nДата публикации: 1867 \nЯзык: Немецкий \nЖанр: политическая экономика \nКоличество страниц: 500',
                    style: AppTypography.font10blackW400.copyWith(fontSize: 12, height: 2),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextAndDescription extends StatelessWidget {
  const _TextAndDescription(
      {required this.name, required this.description});

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 256,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppTypography.font10blackW400,
          ),
          Text(
            description,
            style: AppTypography.font10black.copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
