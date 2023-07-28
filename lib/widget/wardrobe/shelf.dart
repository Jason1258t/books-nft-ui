import 'package:flutter/material.dart';
import 'package:nft/utils/fonts.dart';
import 'package:nft/utils/gradients.dart';
import 'package:nft/widget/buttons/row_elevated_button.dart';

import '../../../widget/wardrobe/book.dart';

const String _topShelfBackground = 'Assets/images/shelf_top.png';
const String _middleShelfBackground = 'Assets/images/shelf_middle.png';
const String _bottomShelfBackground = 'Assets/images/shelf_bottom.png';

const double _topShelfHeightRatio = 191 / 359;
const double _middleShelfHeightRatio = 156 / 359;
const double _bottomShelfHeightRatio = 250 / 359;

const double _topShelfPaddingTopRatio = 30 / 360;
const double _defaultBottomPaddingRatio = 0.061;
const double _bottomShelfBottomPaddingRatio = 1 / 3;

class Shelf extends StatefulWidget {
  const Shelf(
      {super.key,
      required this.width,
      required this.padding,
      required this.height,
      required this.asset,
      required this.isLocked,
      required this.shelfData});

  Shelf.top({super.key, required this.width, required this.shelfData})
      : asset = _topShelfBackground,
        height = _topShelfHeightRatio * width,
        isLocked = false,
        padding = EdgeInsets.only(
            top: width * _topShelfPaddingTopRatio,
            left: width * 0.1,
            right: width * 0.1,
            bottom: width * _defaultBottomPaddingRatio);

  Shelf.middle({super.key, required this.width, required this.shelfData})
      : asset = _middleShelfBackground,
        height = _middleShelfHeightRatio * width,
        isLocked = false,
        padding = EdgeInsets.only(
            left: width * 0.1,
            right: width * 0.1,
            bottom: width * _defaultBottomPaddingRatio,
            top: 0);

  Shelf.bottom(
      {super.key,
      required this.width,
      required this.shelfData,
      this.isLocked = true})
      : asset = _bottomShelfBackground,
        height = _bottomShelfHeightRatio * width,
        padding = EdgeInsets.only(
            top: 0,
            left: width * 0.1,
            right: width * 0.1,
            bottom: width * _bottomShelfBottomPaddingRatio);

  final double width;
  final double height;
  final String asset;
  final EdgeInsets padding;
  final ShelfData shelfData;
  final bool isLocked;

  @override
  State<Shelf> createState() => _ShelfState();
}

class _ShelfState extends State<Shelf> {
  List<Widget> createList() {
    List<Widget> books = [];

    books.addAll(List.generate(
        widget.shelfData.booksData.length,
        (index) => BookWidget(
              shelfWidth: widget.width,
              bookType: BookType.empty,
            )));
    books.addAll(List.generate(
        7 - widget.shelfData.booksData.length - widget.shelfData.lockedBooks,
        (index) => BookWidget(shelfWidth: widget.width, bookType: BookType.add)));
    books.addAll(List.generate(widget.shelfData.lockedBooks,
        (index) => BookWidget(shelfWidth: widget.width, bookType: BookType.lock)));

    return books;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: widget.padding,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(widget.asset), fit: BoxFit.fill),
      ),
      child: !widget.isLocked
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 58,
                  child: Stack(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'Assets/images/billet.png',
                            width: 58,
                          )),
                      Container(
                        padding: const EdgeInsets.only(top: 4),
                        alignment: Alignment.center,
                        child: Text(
                          '${widget.shelfData.booksData.length}/7',
                          style: AppTypography.font12white
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: createList(),
                )
              ],
            )
          : const LockedShelf(),
    );
  }
}

class ShelfData {
  bool isLocked;
  List<BookData> booksData;
  int lockedBooks;

  ShelfData(
      {required this.booksData,
      required this.lockedBooks,
      this.isLocked = false})
      : super() {
    assert(booksData.length + lockedBooks <= 7,
        'the number of books is more than 7');
  }
}

class BookData {
  BookData({required this.imageUrl});

  final String imageUrl;
}

class LockedShelf extends StatelessWidget {
  const LockedShelf({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  offset: Offset.zero, blurRadius: 20, color: Colors.black54)
            ]
        ),
      ),
      Container(
        alignment: Alignment.topRight,
        child: Image.asset(
          'Assets/images/locked_shelf_counter.png',
          width: 58,
        ),
      ),
      Center(
          child: RowElevatedButton(
        text: 'Buy',
        onTap: () {},
        asset1: 'Assets/icons/shopping-bag.svg',
        gradient: AppGradients.wardrobeButtons,
        width: 150,
        height: 56,
      )),
    ]);
  }
}
