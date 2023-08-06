import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/feature/my_books/bloc/purchase/purchase_cubit.dart';
import 'package:nft/feature/store/data/store_repository.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/widget/custom_bottom_sheet/purchase_bottom_sheet.dart';
import 'package:nft/widget/custom_scaffold/custom_scaffold.dart';

import '../../../../models/collection.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/gradients.dart';
import '../../../../widget/app_bar/app_bar.dart';
import '../../../../widget/buttons/custom_elevated_button.dart';

class CollectionInfoScreen extends StatefulWidget {
  const CollectionInfoScreen({super.key});

  @override
  State<CollectionInfoScreen> createState() => _CollectionInfoScreenState();
}

class _CollectionInfoScreenState extends State<CollectionInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final height = MediaQuery.of(context).size.height;

    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final storeBooksRepository =
        RepositoryProvider.of<StoreRepository>(context);

    String idCollection = arguments['id'];

    Collection collection =
        storeBooksRepository.searchCollectionById(idCollection)!;

    void showBuyBook() {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: PurchaseBottomSheet(
                needTitleField: true,
                title: collection.title,
                purchaseCallback: () {
                  BlocProvider.of<PurchaseCubit>(context)
                      .buyBook(collection.id);
                },
              )));
    }

    return CustomScaffold(
      isButtonBack: true,
      appBar: CustomAppBar(
        width: width,
        height: height,
        context: context,
      ),
      child: SingleChildScrollView(
        child: StreamBuilder<bool>(
            stream: storeBooksRepository.saleCollectionUpdateStream,
            builder: (context, snapshot) {
              Collection collection =
                  storeBooksRepository.searchCollectionById(idCollection)!;

              return Padding(
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
                            collection.title,
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
                                  'details': collection.details,
                                  'description': collection.description,
                                  'name': collection.title
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
                          image: NetworkImage(collection.url),
                        )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: width * 0.02,
                                ),
                                Container(
                                    width: double.infinity,
                                    color: Colors.black38,
                                    alignment: Alignment.center,
                                    child: Text(
                                      collection.title,
                                      textAlign: TextAlign.center,
                                      style: AppTypography.font14white,
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: double.infinity,
                                    color: Colors.black38,
                                    alignment: Alignment.center,
                                    child: Text(
                                      collection.author,
                                      textAlign: TextAlign.center,
                                      style: AppTypography.font14white,
                                    )),
                                SizedBox(
                                  height: width * 0.023,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 240,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _IconAndText(
                            color: _IconAndText.commonColor,
                            text: '${collection.commonPercent}%',
                          ),
                          _IconAndText(
                            color: _IconAndText.silverColor,
                            text: '${collection.silverPercent}%',
                          ),
                          _IconAndText(
                            color: _IconAndText.goldColor,
                            text: '${collection.goldPercent}%',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _TextIconAndDescription(
                          name:
                          '${collection.availableBooks}/${collection.maxBooks}',
                          description: 'Left',
                          icon: 'Assets/icons/black_book.svg',
                          width: 100,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        const _TextIconAndDescription(
                          name: 'The Adventures of Sherlock Holmes',
                          description: '',
                          icon: 'Assets/icons/black_info.svg',
                          width: null,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                _TextIconAndDescription(
                                  name: collection.author,
                                  description: 'Author',
                                  icon: 'Assets/icons/black_pensil.svg',
                                  width: 100,
                                ),
                                const _TextIconAndDescription(
                                  name: 'Sereja',
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
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomElevatedButton(
                      text: 'Buy',
                      borderColor: AppColors.darkBorder,
                      onTap: showBuyBook,
                      gradient: AppGradients.redButton,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class _TextIconAndDescription extends StatelessWidget {
  const _TextIconAndDescription(
      {required this.name,
      required this.description,
      required this.icon,
      required this.width, this.mainAxisAlignment});

  final String name;
  final String description;
  final String icon;
  final double? width;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
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
  const _IconAndText({required this.color, required this.text});

  final Color color;
  final String text;

  static const commonColor = Color(0xffA2786C);
  static const silverColor = Color(0xff8C9091);
  static const goldColor = Color(0xffDAAC2B);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: color,
          child: SvgPicture.asset(
            'Assets/icons/book-icon.svg',
            height: 20,
          ),
        ),
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
