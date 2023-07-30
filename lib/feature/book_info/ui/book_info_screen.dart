import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/feature/my_books/bloc/books/my_books_cubit.dart';
import 'package:nft/feature/my_books/bloc/moveBook/move_book_cubit.dart';
import 'package:nft/feature/my_books/bloc/purchase/purchase_cubit.dart';
import 'package:nft/feature/my_books/data/my_books_repository.dart';
import 'package:nft/feature/store/data/store_repository.dart';
import 'package:nft/utils/dialogs.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/widget/custom_bottom_sheet/purchase_bottom_sheet.dart';
import 'package:nft/widget/custom_scaffold/scaffold.dart';

import '../../../models/shelf.dart';
import '../../../utils/colors.dart';
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
    final width = MediaQuery.of(context).size.width;

    final height = MediaQuery.of(context).size.height;

    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final purchaseBloc = BlocProvider.of<PurchaseCubit>(context);

    final id = arguments['book'];
    bool owned = arguments['owned'];
    Book book;
    if (owned) {
      book = RepositoryProvider.of<MyBooksRepository>(context).searchBook(id)!;
    } else {
      book = RepositoryProvider.of<StoreRepository>(context).searchBook(id)!;
    }

    void showBuyBook() async {
      await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: PurchaseBottomSheet(
                needTitleField: true,
                title: book.name,
                purchaseCallback: () {
                  BlocProvider.of<PurchaseCubit>(context).buyBook(book.id);
                },
              )));
      if (purchaseBloc.state is PurchaseSuccess) {
        PurchaseSuccess state = purchaseBloc.state as PurchaseSuccess;
        if (state.buyType == BuyType.book && state.buyId == book.id) {
          setState(() {
            owned = true;
          });
        }
      }
    }

    void removeFromShelf() async {
      BlocProvider.of<MoveBookCubit>(context).removeBook(id);
    }

    void putOnShelf() {
      BlocProvider.of<MoveBookCubit>(context).putBook(id: id);
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
          if (owned) {
            book = RepositoryProvider.of<MyBooksRepository>(context)
                .searchBook(id)!;
          } else {
            book =
                RepositoryProvider.of<StoreRepository>(context).searchBook(id)!;
          }
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
                                arguments: {'book': book});
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.network(
                      book.image,
                      width: width * 0.7,
                      height: height * 0.4,
                      fit: BoxFit.cover,
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
                          description: 'Creator',
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
                    const SizedBox(
                      height: 16,
                    ),
                    book.owned
                        ? Column(
                            children: [
                              CustomElevatedButton(
                                text: book.available
                                    ? 'Put on a shelf'
                                    : 'Remove from shelf',
                                borderColor: AppColors.darkBorder,
                                onTap: book.available
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
                        : CustomElevatedButton(
                            text: 'Buy',
                            borderColor: AppColors.darkBorder,
                            onTap: showBuyBook,
                            gradient: AppGradients.redButton,
                          ),
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
              SizedBox(
                width: 200,
                child: Text(
                  name,
                  style: AppTypography.font10black.copyWith(fontSize: 16),
                ),
              ),
              if (description != '') ...[
                SizedBox(
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
