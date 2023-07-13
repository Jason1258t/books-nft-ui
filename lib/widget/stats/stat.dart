import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/fonts.dart';

class UserStat extends StatelessWidget {
  const UserStat(
      {super.key, required this.text, required this.fill, required this.asset});

  final String text;
  final String asset;
  final double fill;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: ShapeDecoration(
        color: AppColors.statColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Stack(children: [
        fill <= 0.99
            ? ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  width: 96 * fill,
                  height: 20,
                  //color: const Color(0xff6A5D46),
                  decoration: const BoxDecoration(
                    color: AppColors.filedStatColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                  ),
                ),
              )
            : Container(
                width: 96 * fill,
                height: 20,
                //color: const Color(0xff6A5D46),
                decoration: BoxDecoration(
                  color: AppColors.filedStatColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
        Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(asset),
              const SizedBox(
                width: 2,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: AppTypography.font12w700.copyWith(color: Colors.white)
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width - 10, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
