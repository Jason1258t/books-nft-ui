import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum BookType { empty, add, lock }

const String _addBookIcon = 'Assets/icons/plus.svg';
const String _lockedBookIcon = 'Assets/icons/plus.svg';

const Color _addBookBorderColor = Color(0xff86BDFF);
const Color _lockedBookBorderColor = Colors.white;

final BoxDecoration _bookDecoration = BoxDecoration(color: Colors.black.withOpacity(0.4));

class BookWidget extends StatelessWidget {
  BookWidget({super.key, required double shelfWidth, required BookType bookType})
      : _width = shelfWidth * (27.4 / 360),
        _height = shelfWidth * (100 / 360) {
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
  }

  final double _width;
  final double _height;

  late final BoxDecoration? decoration;
  late final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: _width, height: _height, decoration: decoration, child: child),
    );
  }
}
