import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/fonts.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../models/shelf.dart';

class BooksHorizontalContainer extends StatefulWidget {
  const BooksHorizontalContainer({
    super.key,
    required this.book,
    required this.onTap,
  });

  final Book book;
  final Function() onTap;

  @override
  State<BooksHorizontalContainer> createState() =>
      _BooksHorizontalContainerState();
}

class _BooksHorizontalContainerState extends State<BooksHorizontalContainer> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            width: (width - 85) / 3,
            height: 134,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.book.image), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: (width - 85) / 3,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    child: SvgPicture.asset(
                  'Assets/icons/more.svg',
                  color: Colors.grey,
                )),
                Container(
                  alignment: Alignment.topRight,
                  width: (width - 85) / 3 - 20,
                  child: Text(
                    widget.book.name,
                    style: AppTypography.font14white.copyWith(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
