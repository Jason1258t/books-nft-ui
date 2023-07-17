import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDeleteButton extends StatelessWidget {
  const CustomDeleteButton({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: callback,
        child: Container(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              'Assets/icons/delete.svg',
              width: 32,
              height: 32,
            )));
  }
}