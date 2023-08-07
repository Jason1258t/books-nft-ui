import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/fonts.dart';

import '../../models/collection.dart';

class BooksHorizontalContainer extends StatefulWidget {
  const BooksHorizontalContainer({
    super.key,
    required this.author,
    required this.name,
    required this.image,
    required this.type,
    required this.onTap,
  });

  final String name;
  final String image;
  final String author;
  final String type;
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
            height: (width - 85) / 2.25,
            padding: const EdgeInsets.fromLTRB(9.5, 12, 13, 13),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/images/${widget.type}_cover_book.png'),
                    fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.image),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: double.infinity,
                      color: Colors.black38,
                      alignment: Alignment.center,
                      child: Text(
                        widget.name,
                        style: AppTypography.font10white.copyWith(fontSize: 7),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      width: double.infinity,
                      color: Colors.black38,
                      alignment: Alignment.center,
                      child: Text(
                        widget.author,
                        style: AppTypography.font10white.copyWith(fontSize: 7),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
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
                    widget.name,
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
