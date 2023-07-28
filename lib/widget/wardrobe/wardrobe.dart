
import 'package:flutter/material.dart';
import 'package:nft/widget/wardrobe/shelf.dart';

class Wardrobe extends StatefulWidget {
  const Wardrobe({super.key});

  @override
  State<Wardrobe> createState() => _WardrobeState();
}

class _WardrobeState extends State<Wardrobe> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shelf.top(
          width: MediaQuery.of(context).size.width,
          shelfData: ShelfData(booksData: [
            BookData(imageUrl: ''),
            BookData(imageUrl: ''),
            BookData(imageUrl: ''),
            BookData(imageUrl: ''),
          ], lockedBooks: 1),
        ),
        Shelf.middle(
          width: MediaQuery.of(context).size.width,
          shelfData: ShelfData(booksData: [
            BookData(imageUrl: ''),
            BookData(imageUrl: ''),
            BookData(imageUrl: ''),
          ], lockedBooks: 1),
        ),
        Shelf.bottom(
          width: MediaQuery.of(context).size.width,
          isLocked: true,
          shelfData: ShelfData(booksData: [
          ], lockedBooks: 1),
        ),
      ],
    );
  }
}