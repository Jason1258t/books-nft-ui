import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/feature/my_books/bloc/books/my_books_cubit.dart';
import 'package:nft/feature/my_books/data/my_books_repository.dart';

import '../../../models/shelf.dart';
import '../../../utils/dialogs.dart';
import '../../../widget/containers/books_vertical_container.dart';
import '../../../widget/switch/custom_switch.dart';

class MyBooksScreen extends StatefulWidget {
  const MyBooksScreen({super.key, required this.onTap});

  final Function(Book, BuildContext) onTap;

  @override
  State<MyBooksScreen> createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends State<MyBooksScreen> {
  @override
  Widget build(BuildContext context) {
    final myBooksRepository = RepositoryProvider.of<MyBooksRepository>(context);

    List<Widget> listBook = [];
    for (int i = 0; i < myBooksRepository.myBooks.length; i += 2) {
      Row row = Row(children: [
        BooksVerticalContainer(
          onTap: () {
            widget.onTap(myBooksRepository.myBooks[i], context);
          },
          book: myBooksRepository.myBooks[i],
        ),
        const SizedBox(
          width: 30,
        ),
      ]);

      try {
        row.children.add(
          BooksVerticalContainer(
            onTap: () {
              widget.onTap(myBooksRepository.myBooks[i + 1], context);
            },
            book: myBooksRepository.myBooks[i + 1],
          ),
        );
      }catch(e) {}


      listBook.add(row);
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
          ),
          const CustomToggleSwitch(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<MyBooksCubit, MyBooksState>(
              builder: (context, state) {
                if (state is MyBooksLoadingState) {
                  Dialogs.showModal(
                      context,
                      const Center(
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                        ),
                      ));
                  return const SizedBox(height: 1000);
                } else if (state is MyBooksFailState) {
                  listBook == [];
                  return const Row(
                    children: [
                      Text('проблем'),
                      SizedBox(height: 1000),
                    ],
                  );
                } else if (state is MyBooksSuccessState) {
                  return Column(
                    children: listBook.toList(),
                  );
                }

                return const SizedBox(
                  height: 1000,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
