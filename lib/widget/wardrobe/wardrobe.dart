import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/feature/my_books/data/my_books_repository.dart';
import 'package:nft/widget/wardrobe/shelf/shelf.dart';

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
    final repository = RepositoryProvider.of<MyBooksRepository>(context);
    final double width = MediaQuery.of(context).size.width;

    List<Widget> generateShelves() {
      List<Widget> shelves = [];
      shelves.add(
          Shelf.top(width: width, shelfData: repository.wardrobe.shelves[0]));
      for (int i = 1; i < repository.wardrobe.shelves.length - 1; i++) {
        shelves.add(Shelf.middle(
            width: width, shelfData: repository.wardrobe.shelves[i]));
      }
      shelves.add(Shelf.bottom(
          width: width,
          shelfData: repository.wardrobe.shelves.last,
          isLocked: repository.wardrobe.shelves.last.isLocked));

      return shelves;
    }

    List<Widget> generateEmptyShelves() {
      List<Widget> shelves = [];
      shelves.add(Shelf.top(
          width: width,
          shelfData: ShelfData(isLocked: true, shelfId: '', booksData: [])));

      shelves.add(Shelf.middle(
          width: width,
          shelfData: ShelfData(isLocked: true, shelfId: '', booksData: [])));

      shelves.add(Shelf.bottom(
          width: width,
          shelfData: ShelfData(isLocked: true, shelfId: '', booksData: []),
          isLocked: true));

      return shelves;
    }

    return BlocBuilder<WardrobeCubit, WardrobeState>(
      builder: (context, state) {
        if (state is WardrobeSuccessState) {
          return Column(
            children: generateShelves(),
          );
        }
        return Column(
          children: generateEmptyShelves(),
        );
      },
    );
  }
}
