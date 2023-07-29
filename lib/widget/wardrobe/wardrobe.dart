
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/widget/wardrobe/shelf.dart';

import '../../feature/my_books/bloc/wardrobe/wardrobe_cubit.dart';
import '../../models/shelf.dart';

class Wardrobe extends StatefulWidget {
  const Wardrobe({super.key});

  @override
  State<Wardrobe> createState() => _WardrobeState();
}

class _WardrobeState extends State<Wardrobe> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WardrobeCubit, WardrobeState>(
  builder: (context, state) {
    return Column(
      children: [
        Shelf.top(
          width: MediaQuery.of(context).size.width,
          shelfData: ShelfData(booksData: [
            Book(name: 'Example book', image: 'Assets/images/conan_doyle_book.png', owned: true),
            Book(name: 'Example book', image: 'Assets/images/conan_doyle_book.png', owned: true),
            Book(name: 'Example book', image: 'Assets/images/conan_doyle_book.png', owned: true),
            Book(name: 'Example book', image: 'Assets/images/conan_doyle_book.png', owned: true),
            null,
            null,
          ], shelfId: ''),
        ),
        Shelf.middle(
          width: MediaQuery.of(context).size.width,
          shelfData: ShelfData(booksData: [
            Book(name: 'Example book', image: 'Assets/images/conan_doyle_book.png', owned: true),
            null,
            Book(name: 'Example book', image: 'Assets/images/conan_doyle_book.png', owned: true),
            null,
            null,
            null,
          ], shelfId: ''),
        ),
        Shelf.bottom(
          width: MediaQuery.of(context).size.width,
          isLocked: true,
          shelfData: ShelfData(booksData: [
          ], shelfId: ''),
        ),
      ],
    );
  },
);
  }
}