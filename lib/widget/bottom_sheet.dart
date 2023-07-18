import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft/feature/home/data/homa_repository.dart';
import 'package:nft/utils/gradients.dart';

import '../utils/fonts.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, this.children, required this.title});

  final List<Widget>? children;
  final String title;

  @override
  Widget build(BuildContext context) {
    List<Widget> generateChildren() {
      List<Widget> c = [
        Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text(title, style: AppTypography.font24w700Gilroy)],
              ),
            ),
            Container(
              height: 34,
              alignment: Alignment.centerLeft,
              child: InkWell(
                child: SvgPicture.asset('Assets/icons/chevron-left.svg'),
                onTap: () {
                  Navigator.of(context).pop();
                  RepositoryProvider.of<HomeRepository>(context).showBottomSheet = false;
                },
              ),
            )
          ],
        ),
      ];
      c.addAll(children ?? []);
      return c;
    }

    return InkWell(
      onTap: () {FocusScope.of(context).requestFocus(FocusNode());},
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 398,
        width: double.infinity,
        decoration: const ShapeDecoration(
          gradient: AppGradients.bottomSheet,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x4C000000),
              blurRadius: 15,
              offset: Offset(0, -7),
              spreadRadius: -4,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: generateChildren(),
        ),
      ),
    );
  }
}
