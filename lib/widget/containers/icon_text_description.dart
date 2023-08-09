import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/fonts.dart';

class TextIconAndDescription extends StatelessWidget {
  const TextIconAndDescription(
      {required this.name,
        required this.description,
        required this.icon,
        required this.width,
        this.mainAxisAlignment});

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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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