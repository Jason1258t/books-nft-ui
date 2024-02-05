import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/feature/book_info/bloc/book_info/book_info_cubit.dart';
import 'package:nft/feature/book_info/data/book_info_repository.dart';
import 'package:nft/feature/my_books/bloc/books/my_books_cubit.dart';
import 'package:nft/feature/my_books/bloc/moveBook/move_book_cubit.dart';
import 'package:nft/utils/dialogs.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/widget/custom_scaffold/custom_scaffold.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/gradients.dart';
import '../../../../widget/app_bar/app_bar.dart';
import '../../../../widget/buttons/custom_elevated_button.dart';
import '../../../../widget/containers/big_book_container.dart';
import '../../../../widget/containers/icon_text_description.dart';

class BookInfoScreen extends StatefulWidget {
  const BookInfoScreen({super.key});

  @override
  State<BookInfoScreen> createState() => _BookInfoScreenState();
}

class _BookInfoScreenState extends State<BookInfoScreen> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final height = MediaQuery.of(context).size.height;

    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    int bookId = arguments['book_id'];

    RepositoryProvider.of<BookInfoRepository>(context).getBookInfoById(bookId);

    void removeFromShelf() async {
      BlocProvider.of<MoveBookCubit>(context).removeBook(id: '$bookId');
    }

    void putOnShelf() {
      BlocProvider.of<MoveBookCubit>(context).putBook(id: '$bookId');
    }

    return BlocListener<MoveBookCubit, MoveBookState>(
      listener: (context, state) {
        if (state is MoveBookLoadingState) {
          Dialogs.showModal(
              context,
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              ));
        } else {
          Dialogs.hide(context);
        }
      },
      child: BlocBuilder<MyBooksCubit, MyBooksState>(
        builder: (context, state) {
          return CustomScaffold(
            isButtonBack: true,
            appBar: CustomAppBar(
              width: width,
              height: height,
              context: context,
            ),
            child: BlocBuilder<BookInfoCubit, BookInfoState>(
                builder: (context, state) {
              final book = RepositoryProvider.of<BookInfoRepository>(context)
                  .currentBook;

              if (state is BookInfoLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is BookInfoFail) {
                return Text('проблем');
              } else {
                return SingleChildScrollView(
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
                            SizedBox(
                              width: 240,
                              child: Text(
                                book?.name ?? '',
                                style: AppTypography.font20white
                                    .copyWith(fontSize: 24),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ),
                            InkWell(
                              child: SvgPicture.asset('Assets/icons/info.svg'),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/second_book_info_screen',
                                    arguments: {
                                      'book_id': bookId,
                                      'name': book?.name ?? ''
                                    });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BigBookContainer(
                          name: book?.name ?? '',
                          author: book?.author ?? '',
                          image: book?.cover_url ?? '',
                          type: book?.rare ?? '',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _IconAndText(
                              icon: 'Assets/icons/black_brain.svg',
                              text: book?.brain.toString() ?? '',
                            ),
                            _IconAndText(
                              icon: 'Assets/icons/black_shied.svg',
                              text: book?.shield.toString() ?? '',
                            ),
                            _IconAndText(
                              icon: 'Assets/icons/black_lightning.svg',
                              text: book?.energy.toString() ?? '',
                            ),
                            _IconAndText(
                              icon: 'Assets/icons/black_clever.svg',
                              text: book?.luck.toString() ?? '',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          children: [
                            TextIconAndDescription(
                              name: '${book?.rare.toUpperCase() ?? ''} BOOK',
                              description: '',
                              icon: 'Assets/icons/red_star.svg',
                              width: 200,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    TextIconAndDescription(
                                      name: book?.name ?? '',
                                      description: '',
                                      icon: 'Assets/icons/black_info.svg',
                                      width: (width - 163) / 2,
                                    ),
                                    TextIconAndDescription(
                                      name: book?.author ?? '',
                                      description: 'Author',
                                      icon: 'Assets/icons/black_pensil.svg',
                                      width: (width - 163) / 2,
                                    ),
                                    TextIconAndDescription(
                                      name: book?.creator ?? '',
                                      description: 'Creator',
                                      icon: 'Assets/icons/black_lightning.svg',
                                      width: (width - 163) / 2,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    TextIconAndDescription(
                                      name: book?.income.toString() ?? '',
                                      description: 'Income',
                                      icon: 'Assets/icons/black_dollar.svg',
                                      width: (width - 163) / 2,
                                    ),
                                    TextIconAndDescription(
                                      name:
                                          '${book?.current_images.toString() ?? ''}/${book?.max_images.toString() ?? ''}',
                                      description: 'Images',
                                      icon: 'Assets/icons/black_image.svg',
                                      width: (width - 163) / 2,
                                    ),
                                    TextIconAndDescription(
                                      name: book?.activities.toString() ?? '',
                                      description: 'Activities',
                                      icon: 'Assets/icons/black_compas.svg',
                                      width: (width - 163) / 2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: [
                            CustomElevatedButton(
                              text: book?.on_shelf ?? true
                                  ? 'Remove from shelf'
                                  : 'Put on a shelf',
                              borderColor: AppColors.darkBorder,
                              onTap: book?.on_shelf ?? true
                                  ? putOnShelf
                                  : removeFromShelf,
                              gradient: AppGradients.lightButton,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomElevatedButton(
                              text: 'Read',
                              borderColor: AppColors.buttonDarkColor,
                              onTap: () {},
                              gradient: const LinearGradient(colors: [
                                AppColors.buttonDarkColor,
                                AppColors.buttonDarkColor
                              ]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
            }),
          );
        },
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
