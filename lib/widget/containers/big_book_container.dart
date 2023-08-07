import 'package:flutter/material.dart';

import '../../utils/fonts.dart';

class BigBookContainer extends StatelessWidget {
  const BigBookContainer(
      {super.key,
      required this.image,
      required this.name,
      required this.author,
      required this.type});

  final String image;
  final String author;
  final String name;
  final String type;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Container(
      width: width * 0.58,
      height: width * 0.77,
      padding: EdgeInsets.fromLTRB(
          width * 0.06, width * 0.06, width * 0.072, width * 0.072),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("Assets/images/${type}_cover_book.png"),
      )),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: double.infinity,
                color: Colors.black38,
                alignment: Alignment.center,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: AppTypography.font14white,
                )),
            Container(
                width: double.infinity,
                color: Colors.black38,
                alignment: Alignment.center,
                child: Text(
                  author,
                  textAlign: TextAlign.center,
                  style: AppTypography.font14white,
                )),
          ],
        ),
      ),
    );
  }
}
