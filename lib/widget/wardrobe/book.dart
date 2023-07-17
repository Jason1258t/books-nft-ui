import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Book extends StatelessWidget {
  const Book({super.key, required this.decoration, required this.child})
      : _width = 27.4,
        _height = 105;

  Book.add({super.key, required double shelfWidth})
      : decoration = BoxDecoration(color: Colors.black.withOpacity(0.4)),
        child = DottedBorder(
            strokeWidth: 1.48,
            color: const Color(0xff86BDFF),
            dashPattern: const [5.18, 5.18],
            radius: const Radius.circular(3),
            child: Center(
              child: SvgPicture.asset(
                'Assets/icons/plus.svg',
                width: 16,
              ),
            )),
        _width = shelfWidth * (27.4 / 360),
        _height = shelfWidth * (100 / 360);

  Book.lock({super.key, required double shelfWidth})
      : decoration = BoxDecoration(color: Colors.black.withOpacity(0.4)),
        child = DottedBorder(
            strokeWidth: 1.48,
            color: Colors.white,
            dashPattern: const [5.18, 5.18],
            radius: const Radius.circular(3),
            child: Center(
              child: SvgPicture.asset(
                'Assets/icons/lock.svg',
                width: 16,
              ),
            )),
        _width = shelfWidth * (27.4 / 360),
        _height = shelfWidth * (100 / 360);

  Book.empty({super.key, required double shelfWidth})
      : decoration = BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.red,
        ),
        child = null,
        _width = shelfWidth * (27.4 / 360),
        _height = shelfWidth * (100 / 360);

  final double _width;
  final double _height;

  final BoxDecoration? decoration;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: _width, height: _height, decoration: decoration, child: child),
    );
  }
}
