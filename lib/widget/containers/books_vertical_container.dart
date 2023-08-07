import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft/utils/fonts.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../models/shelf.dart';
import '../../utils/colors.dart';

class BooksVerticalContainer extends StatefulWidget {
  const BooksVerticalContainer(
      {super.key,
      required this.onTap,
      required this.author,
      required this.name,
      required this.image,
      required this.type});

  final Function() onTap;
  final String name;
  final String image;
  final String type;
  final String author;

  @override
  State<BooksVerticalContainer> createState() => _BooksVerticalContainerState();
}

class _BooksVerticalContainerState extends State<BooksVerticalContainer> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: widget.onTap,
            child: Container(
              width: width * 0.41,
              height: width * 0.55,
              padding: const EdgeInsets.fromLTRB(15, 15, 20, 20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'Assets/images/${widget.type}_cover_book.png',
                      ),
                      fit: BoxFit.fill)),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(widget.image),
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: width * 0.017,
                        ),
                        Container(
                            width: double.infinity,
                            color: Colors.black38,
                            alignment: Alignment.center,
                            child: Text(
                              widget.name,
                              style: AppTypography.font12white,
                              textAlign: TextAlign.center,
                            )),
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
                              widget.author,
                              style: AppTypography.font12white,
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                          height: width * 0.016,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 0, 0),
                    child: SvgPicture.asset(
                      'Assets/icons/Subtract.svg',
                      width: 32,
                      height: 32,
                      color: Colors.black26.withOpacity(0.3),
                    ),
                  ),
                  SvgPicture.asset(
                    'Assets/icons/Subtract.svg',
                    width: 32,
                    height: 32,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(9, 7, 0, 0),
                    child: Text(
                      '78%',
                      style: AppTypography.font20white.copyWith(fontSize: 10),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SvgPicture.asset(
                  'Assets/icons/more.svg',
                  width: 4,
                  height: 4,
                ),
              ),
            ],
          ),
        ],
      )
    ]);
  }
}
