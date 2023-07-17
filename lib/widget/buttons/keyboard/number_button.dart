import 'package:flutter/material.dart';

import '../../../utils/fonts.dart';

class CustomNumberButton extends StatelessWidget {
  const CustomNumberButton(
      {super.key, required this.callback, required this.text});

  final VoidCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.white,
        onTap: callback,
        child: SizedBox(
          width: 64,
          height: 64,
          child: Center(
            child: Text(text,
                textAlign: TextAlign.center, style: AppTypography.font36w800),
          ),
        ));
  }
}