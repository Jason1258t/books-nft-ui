import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/models/collection.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/widget/containers/books_horizontal_container.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../utils/colors.dart';

class CustomCategoryScroller extends StatelessWidget {
  const CustomCategoryScroller({super.key, required this.genre});

  final BooksGenre genre;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    List<Collection> listCollection = genre.collections.length <= 3
        ? genre.collections
        : genre.collections.sublist(0, 3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: StrokeText(
              strokeColor: AppColors.isNoActiveStrokeText,
              strokeWidth: 2.5,
              textStyle: AppTypography.font20gold.copyWith(fontSize: 14),
              text:
                  '${genre.name[0].toUpperCase()}${genre.name.substring(1)}',
            )),
        Container(
          width: width,
          height: 3,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 50,
              colors: [Color(0xFFFDF2DF), Color(0xFF897F67)],
            ),
          ),
        ),
        Stack(children: [
          Container(
              width: width,
              height: width * 0.45,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter,
                  radius: 1.2,
                  colors: [Color(0xffA1A7A3), Color(0xFF6C7970)],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width,
                    height: 2,
                    color: AppColors.lvlText,
                  ),
                  Row(
                      children: listCollection
                          .map((e) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 5),
                                child: BooksHorizontalContainer(
                                  name: e.name,
                                  author: e.author,
                                  image: e.image,
                                  type: 'silver',
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/collection_info_screen',
                                        arguments: {
                                          'id': e.id,
                                        });
                                  },
                                ),
                              ))
                          .toList()),
                  Container(
                    width: width,
                    height: 2,
                    color: AppColors.lvlText,
                  )
                ],
              )),
          Container(
            width: width,
            height: width * 0.4,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/category_books_screen', arguments: {'genre': genre.name});
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                      width: 40,
                      child: Text(
                        'Show More',
                        textAlign: TextAlign.center,
                        style: AppTypography.font20gold.copyWith(fontSize: 12),
                      )),
                  SvgPicture.asset('Assets/icons/arrow.svg')
                ],
              ),
            ),
          ),
        ]),
        Container(
          width: width,
          height: 3,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 50,
              colors: [Color(0xFFFDF2DF), Color(0xFF897F67)],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
