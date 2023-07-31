import 'package:flutter/material.dart';
import 'package:nft/widget/custom_scaffold/scaffold.dart';

import '../../../models/shelf.dart';
import '../../../utils/fonts.dart';
import '../../../widget/app_bar/app_bar.dart';

class SecondBookInfoScreen extends StatelessWidget {
  const SecondBookInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final book = arguments['book'] as Book;

    return CustomScaffold(
      appBar: CustomAppBar(
        width: width,
        height: height,
        context: context,
      ),
      isButtonBack: true,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Text(
            book.name,
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
            book.description,
            style: AppTypography.font10blackW400.copyWith(fontSize: 12,fontWeight: FontWeight.w600),
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
                'ISBN: ${book.ISBN} \nДата публикации: ${book.createAt} \nЯзык: ${book.language} \nЖанр: ${book.genre} \nКоличество страниц: ${book.pagesCount}',
                style: AppTypography.font10blackW400
                    .copyWith(fontSize: 12, height: 2,fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
