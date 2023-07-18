import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft/utils/fonts.dart';

class BooksContainer extends StatefulWidget {
  const BooksContainer({super.key});

  @override
  State<BooksContainer> createState() => _BooksContainerState();
}

class _BooksContainerState extends State<BooksContainer> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: width * 0.69,
      width: width * 0.9,
      alignment: Alignment.center,
      child: Stack(children: [
        Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/book_info_screen');
                      },
                      child: Container(
                        width: width * 0.41,
                        height: width * 0.55,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'Assets/images/redBook.png',
                                ),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(7, 0, 13, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Capital: A Critique of Political Economy',
                                textAlign: TextAlign.center,
                                style: AppTypography.font16white
                                    .copyWith(fontSize: 12),
                              ),
                              Text(
                                'Karl Marx',
                                style: AppTypography.font16white
                                    .copyWith(fontSize: 14),
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
                                style: AppTypography.font20white
                                    .copyWith(fontSize: 10),
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
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/book_info_screen');},
                      child: Container(
                        width: width * 0.41,
                        height: width * 0.55,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'Assets/images/blueBook.png',
                                ),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(7, 0, 13, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Capital: A Critique of Political Economy',
                                textAlign: TextAlign.center,
                                style: AppTypography.font16white
                                    .copyWith(fontSize: 12),
                              ),
                              Text(
                                'Karl Marx',
                                style: AppTypography.font16white
                                    .copyWith(fontSize: 14),
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
                                style: AppTypography.font20white
                                    .copyWith(fontSize: 10),
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
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
