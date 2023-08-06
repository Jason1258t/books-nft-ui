import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/utils/fonts.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../models/collection.dart';

class CollectionHorizontalContainer extends StatefulWidget {
  const CollectionHorizontalContainer({
    super.key,
    required this.collection,
    required this.onTap,
  });

  final Collection collection;
  final Function() onTap;

  @override
  State<CollectionHorizontalContainer> createState() =>
      _CollectionHorizontalContainerState();
}

class _CollectionHorizontalContainerState
    extends State<CollectionHorizontalContainer> {
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
            padding: const EdgeInsets.fromLTRB(9.5, 9.5, 13, 13),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/images/book_cover.png'),
                    fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(widget.collection.url),
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: width * 0.01,
                      ),
                      Container(
                          width: double.infinity,
                          color: Colors.black38,
                          alignment: Alignment.center,
                          child: Text(
                            widget.collection.title,
                            style:
                                AppTypography.font10white.copyWith(fontSize: 7),
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
                            widget.collection.author,
                            style:
                                AppTypography.font10white.copyWith(fontSize: 7),
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                        height: width * 0.01,
                      ),
                    ],
                  ),
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
                    widget.collection.title,
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
