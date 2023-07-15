import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widget/containers/statistics.dart';
import '../../../widget/stats/stat.dart';

class WardrobeScreen extends StatefulWidget {
  const WardrobeScreen({super.key});

  @override
  State<WardrobeScreen> createState() => _WardrobeScreenState();
}

class _WardrobeScreenState extends State<WardrobeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Assets/images/backgroundHome.png"),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UserStat(
                            text: 'x1.4',
                            fill: 0,
                            asset: 'Assets/icons/Vector-2.svg'),
                        UserStat(
                            text: '3,3/5',
                            fill: 3.3 / 5,
                            asset: 'Assets/icons/energy.svg'),
                        UserStat(
                            text: '85%',
                            fill: 0.85,
                            asset: 'Assets/icons/shield.svg'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            StatisticsContainer(),
                            StatisticsContainer(),
                          ],
                        ),
                        Column(
                          children: [
                            StatisticsContainer(),
                            StatisticsContainer(),
                          ],
                        ),
                        SizedBox(
                          width: 86,
                          height: 56,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  TopShelf(
                    addBooks: 2,
                    lockedBooks: 1,
                  ),
                  MiddleShelf(
                    addBooks: 4,
                    lockedBooks: 1,
                  ),
                  MiddleShelf(
                    addBooks: 4,
                    lockedBooks: 1,
                  ),
                  BottomShelf(addBooks: 4,
                    lockedBooks: 1,)
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class TopShelf extends StatefulWidget {
  const TopShelf(
      {super.key, required this.addBooks, required this.lockedBooks});

  final int addBooks;
  final int lockedBooks;

  @override
  State<TopShelf> createState() => _TopShelfState();
}

class _TopShelfState extends State<TopShelf> {
  List<Widget> createList() {
    List<Widget> books = [];

    books.addAll(List.generate(
        7 - (widget.addBooks + widget.lockedBooks), (index) => const Book()));
    books.addAll(List.generate(widget.addBooks, (index) => const AddBook()));
    books.addAll(
        List.generate(widget.lockedBooks, (index) => const LockedBook()));

    return books;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 191,
      padding:
          const EdgeInsets.only(top: 32.4, left: 36, right: 36, bottom: 21.5),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('Assets/images/shelf_top.png'),
            fit: BoxFit.fitWidth),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: createList(),
          )
        ],
      ),
    );
  }
}

class MiddleShelf extends StatefulWidget {
  const MiddleShelf(
      {super.key, required this.addBooks, required this.lockedBooks});

  final int addBooks;
  final int lockedBooks;

  @override
  State<MiddleShelf> createState() => _MiddleShelfState();
}

class _MiddleShelfState extends State<MiddleShelf> {
  List<Widget> createList() {
    List<Widget> books = [];

    books.addAll(List.generate(
        7 - (widget.addBooks + widget.lockedBooks), (index) => const Book()));
    books.addAll(List.generate(widget.addBooks, (index) => const AddBook()));
    books.addAll(
        List.generate(widget.lockedBooks, (index) => const LockedBook()));

    return books;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156,
      padding: const EdgeInsets.only(left: 36, right: 36, bottom: 22),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/images/shelf_midle.png'),
              fit: BoxFit.fitWidth)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: createList(),
          )
        ],
      ),

    );
  }
}

class BottomShelf extends StatefulWidget {
  const BottomShelf({super.key, required this.addBooks, required this.lockedBooks});

  final int addBooks;
  final int lockedBooks;

  @override
  State<BottomShelf> createState() => _BottomShelfState();
}

class _BottomShelfState extends State<BottomShelf> {
  List<Widget> createList() {
    List<Widget> books = [];

    books.addAll(List.generate(
        7 - (widget.addBooks + widget.lockedBooks), (index) => const Book()));
    books.addAll(List.generate(widget.addBooks, (index) => const AddBook()));
    books.addAll(
        List.generate(widget.lockedBooks, (index) => const LockedBook()));

    return books;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.only(left: 36, right: 36, bottom: 120),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/images/shelf_bottom.png'),
              fit: BoxFit.fitWidth)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: createList(),
          )
        ],
      ),
    );
  }
}

class AddBook extends StatelessWidget {
  const AddBook({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 27.4,
        height: 105,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
        ),
        child: DottedBorder(
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
      ),
    );
  }
}

class LockedBook extends StatelessWidget {
  const LockedBook({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 27.4,
        height: 105,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
        ),
        child: DottedBorder(
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
      ),
    );
  }
}

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 27.4,
        height: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.red,
        ),
      ),
    );
  }
}
