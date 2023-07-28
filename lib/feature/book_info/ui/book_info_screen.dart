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
      appBar: AppBars(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 240,
                    child: Text(
                      'Das Kapital. Kritik der politischen...',
                      style: AppTypography.font20white.copyWith(fontSize: 24),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                  InkWell(
                    child: SvgPicture.asset('Assets/icons/info.svg'),
                    onTap: () {
                      Navigator.pushNamed(context, '/second_book_info_screen');
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset('Assets/images/conan_doyle_book.png'),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _IconAndText(
                    icon: 'Assets/icons/black_brain.svg',
                    text: '25',
                  ),
                  _IconAndText(
                    icon: 'Assets/icons/black_shied.svg',
                    text: '25',
                  ),
                  _IconAndText(
                    icon: 'Assets/icons/black_lightning.svg',
                    text: '15',
                  ),
                  _IconAndText(
                    icon: 'Assets/icons/black_clever.svg',
                    text: '53',
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Column(
                children: [
                  _TextIconAndDescription(
                    name: 'GOLDEN BOOK',
                    description: '',
                    icon: 'Assets/icons/red_star.svg',
                  ),
                  _TextIconAndDescription(
                    name: 'The Adventures of Sherlock Holmes',
                    description: '',
                    icon: 'Assets/icons/black_info.svg',
                  ),
                  _TextIconAndDescription(
                    name: 'Karl Marx',
                    description: 'Author',
                    icon: 'Assets/icons/black_pensil.svg',
                  ),
                  _TextIconAndDescription(
                    name: 'Sereja',
                    description: 'Creato',
                    icon: 'Assets/icons/black_lightning.svg',
                  ),
                  _TextIconAndDescription(
                    name: '8-16',
                    description: 'Колличество активностей',
                    icon: 'Assets/icons/black_compas.svg',
                  ),
                  _TextIconAndDescription(
                    name: '10-52',
                    description: 'Возможный доход',
                    icon: 'Assets/icons/black_dollar.svg',
                  ),
                  _TextIconAndDescription(
                    name: '13/16',
                    description: 'Колличество изображений:',
                    icon: 'Assets/icons/black_image.svg',
                  ),
                ],
              ),
              SizedBox(height: 16,),
              CustomElevatedButton(
                text: 'Read',
                onTap: () {},
                gradient: AppGradients.lightButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextIconAndDescription extends StatelessWidget {
  const _TextIconAndDescription(
      {required this.name, required this.description, required this.icon});

  final String name;
  final String description;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 35,
            height: 35,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            children: [
              Container(
                width: 200,
                child: Text(
                  name,
                  style: AppTypography.font10black.copyWith(fontSize: 16),
                ),
              ),
              if (description != '') ...[
                Container(
                  width: 200,
                  child: Text(
                    description,
                    style: AppTypography.font12dark.copyWith(fontSize: 14),
                  ),
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }
}

class _IconAndText extends StatelessWidget {
  const _IconAndText({required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(icon),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: AppTypography.font10black.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
