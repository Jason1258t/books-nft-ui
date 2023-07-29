import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/colors.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../models/shelf.dart';

class BooksHorizontalContainer extends StatefulWidget {
  const BooksHorizontalContainer({super.key, required this.book, required this.onTap,});

  final Book book;
  final Function() onTap;

  @override
  State<BooksHorizontalContainer> createState() =>
      _BooksHorizontalContainerState();
}

class _BooksHorizontalContainerState extends State<BooksHorizontalContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 134,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(widget.book.image),
            )),
          ),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(child: SvgPicture.asset('Assets/icons/more.svg', color: Colors.grey,)),
                 StrokeText(
                  text: widget.book.name,
                  strokeWidth: 1,
                  strokeColor: AppColors.darkText,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
