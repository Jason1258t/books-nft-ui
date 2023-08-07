import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/feature/my_books/bloc/books/my_books_cubit.dart';
import 'package:nft/feature/my_books/bloc/moveBook/move_book_cubit.dart';
import 'package:nft/feature/my_books/data/my_books_repository.dart';
import 'package:nft/utils/dialogs.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/widget/custom_scaffold/custom_scaffold.dart';

import '../../../../models/shelf.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/gradients.dart';
import '../../../../widget/app_bar/app_bar.dart';
import '../../../../widget/buttons/custom_elevated_button.dart';

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

    final myBooksRepository = RepositoryProvider.of<MyBooksRepository>(context);

    Book book = arguments['book'];

    void removeFromShelf() async {
      BlocProvider.of<MoveBookCubit>(context).removeBook(id: book.id);
    }

    void putOnShelf() {
      BlocProvider.of<MoveBookCubit>(context).putBook(id: book.id);
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
          book = myBooksRepository.searchBookById(book.id)!;
          return CustomScaffold(
            isButtonBack: true,
            appBar: CustomAppBar(
              width: width,
              height: height,
              context: context,
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
                        SizedBox(
                          width: 240,
                          child: Text(
                            book.name,
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
                                  'details': book.details,
                                  'description': book.description,
                                  'name': book.name,
                                });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 240,
                      height: 320,
                      padding: const EdgeInsets.fromLTRB(25, 25, 30, 30),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("Assets/images/book_cover.png"))),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(book.image),
                              fit: BoxFit.fill
                        )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: double.infinity,
                                color: Colors.black38,
                                alignment: Alignment.center,
                                child: Text(
                                  book.name,
                                  textAlign: TextAlign.center,
                                  style: AppTypography.font14white,
                                )),
                            Container(
                                width: double.infinity,
                                color: Colors.black38,
                                alignment: Alignment.center,
                                child: Text(
                                  book.author,
                                  textAlign: TextAlign.center,
                                  style: AppTypography.font14white,
                                )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _IconAndText(
                          icon: 'Assets/icons/black_brain.svg',
                          text: book.intelegenceInc.toString(),
                        ),
                        _IconAndText(
                          icon: 'Assets/icons/black_shied.svg',
                          text: book.strengthInc.toString(),
                        ),
                        _IconAndText(
                          icon: 'Assets/icons/black_lightning.svg',
                          text: book.energyInc.toString(),
                        ),
                        _IconAndText(
                          icon: 'Assets/icons/black_clever.svg',
                          text: book.luckInc.toString(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Column(
                      children: [
                        _TextIconAndDescription(
                          name: '${book.type.toUpperCase()} BOOK',
                          description: '',
                          icon: 'Assets/icons/red_star.svg',
                          width: 200,
                        ),
                        const _TextIconAndDescription(
                          name: 'The Adventures of Sherlock Holmes',
                          description: '',
                          icon: 'Assets/icons/black_info.svg',
                          width: 200,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                _TextIconAndDescription(
                                  name: book.author,
                                  description: 'Author',
                                  icon: 'Assets/icons/black_pensil.svg',
                                  width: 100,
                                ),
                                const _TextIconAndDescription(
                                  name: 'Serena',
                                  description: 'Creator',
                                  icon: 'Assets/icons/black_lightning.svg',
                                  width: 100,
                                ),
                                const _TextIconAndDescription(
                                  name: '8-16',
                                  description: 'Activities',
                                  icon: 'Assets/icons/black_compas.svg',
                                  width: 100,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Column(
                              children: [
                                _TextIconAndDescription(
                                  name: '10-52',
                                  description: 'Income',
                                  icon: 'Assets/icons/black_dollar.svg',
                                  width: 100,
                                ),
                                _TextIconAndDescription(
                                  name: '13/16',
                                  description: 'Images',
                                  icon: 'Assets/icons/black_image.svg',
                                  width: 100,
                                ),
                                _TextIconAndDescription(
                                  name: '13/100',
                                  description: 'Left',
                                  icon: 'Assets/icons/black_book.svg',
                                  width: 100,
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
                          text: book.available
                              ? 'Put on a shelf'
                              : 'Remove from shelf',
                          borderColor: AppColors.darkBorder,
                          onTap: book.available ? putOnShelf : removeFromShelf,
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
            ),
          );
        },
      ),
    );
  }
}

class _TextIconAndDescription extends StatelessWidget {
  const _TextIconAndDescription(
      {required this.name,
      required this.description,
      required this.icon,
      required this.width});

  final String name;
  final String description;
  final String icon;
  final double width;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width,
                child: Text(
                  name,
                  style: AppTypography.font10black.copyWith(fontSize: 16),
                ),
              ),
              if (description != '') ...[
                SizedBox(
                  width: width,
                  child: Text(
                    description,
                    style: AppTypography.font12dark
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
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
