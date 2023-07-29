import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft/feature/my_books/ui/my_books_screen.dart';
import 'package:nft/widget/custom_bottom_sheet/bottom_sheet.dart';
import 'package:nft/widget/custom_scaffold/scaffold.dart';

import '../../models/shelf.dart';
import '../../utils/colors.dart';
import '../../utils/fonts.dart';
import '../app_bar/empty_app_bar.dart';
import '../buttons/custom_elevated_button.dart';

enum BookType { withData, add, lock }

const String _addBookIcon = 'Assets/icons/plus.svg';
const String _lockedBookIcon = 'Assets/icons/plus.svg';

const Color _addBookBorderColor = Color(0xff86BDFF);
const Color _lockedBookBorderColor = Colors.white;

final BoxDecoration _bookDecoration =
    BoxDecoration(color: Colors.black.withOpacity(0.4));

class BookWidget extends StatelessWidget {
  BookWidget(
      {super.key,
      required double shelfWidth,
      required BookType bookType,
      this.data})
      : _width = shelfWidth * (27.4 / 360),
        _height = shelfWidth * (100 / 360) {
    assert(
        bookType == BookType.withData && data != null ||
            bookType != BookType.withData,
        'if book has info data cant be null');
    if (bookType == BookType.add || bookType == BookType.lock) {
      decoration = _bookDecoration;
      child = DottedBorder(
          strokeWidth: 1.48,
          color: bookType == BookType.add
              ? _addBookBorderColor
              : _lockedBookBorderColor,
          dashPattern: const [5.18, 5.18],
          radius: const Radius.circular(3),
          child: Center(
            child: SvgPicture.asset(
              bookType == BookType.add ? _addBookIcon : _lockedBookIcon,
              width: 16,
            ),
          ));
    } else {
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.red,
      );
      child = null;
    }

    _bookType = bookType;
  }

  final Book? data;

  final double _width;
  final double _height;

  late BookType _bookType;

  late final BoxDecoration? decoration;
  late final Widget? child;

  late final onTap;

  _buyPlace() {}

  _openBook(Book book, BuildContext context) {
    Navigator.pushNamed(context, '/book_info_screen',
        arguments: {'book': book});
  }

  _addBook(Book book, BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (BuildContext context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: CustomBottomSheet(
              title: 'Put on a shelf',
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: const BoxConstraints(minHeight: 60),
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        margin: const EdgeInsets.only(top: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.backGroundTextShowButtonSheet),
                        alignment: Alignment.center,
                        child: Text(
                          book.name,
                          textAlign: TextAlign.center,
                          style: AppTypography.font16white,
                        ),
                      ),
                      CustomElevatedButton(
                          text: 'Confirm',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            //TODO сделать добавление с блоком/репозиторием
                          }),
                    ],
                  ),
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    if (_bookType == BookType.add) {
      onTap = () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CustomScaffold(
                    appBar: EmptyAppBar(
                      context: context,
                    ),
                    child: MyBooksScreen(onTap: _addBook))));
      };
    } else if (_bookType == BookType.lock) {
      onTap = _buyPlace();
    } else {
      onTap = () {
        _openBook(data!, context);
      };
    }
    return InkWell(
      onTap: onTap,
      child: Container(
          width: _width, height: _height, decoration: decoration, child: child),
    );
  }
}
