import 'package:flutter/material.dart';

class BooksContainer extends StatefulWidget {
  const BooksContainer({super.key});

  @override
  State<BooksContainer> createState() => _BooksContainerState();
}

class _BooksContainerState extends State<BooksContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 228,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Assets/images/backgroundBooks.png'),
        )
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('Assets/images/book.png', width: 136,),
              SizedBox(width: 30,),
              Image.asset('Assets/images/book.png', width: 136,),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
