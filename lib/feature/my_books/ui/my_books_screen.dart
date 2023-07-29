import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/feature/my_books/bloc/my_books_cubit.dart';
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

Book book = Book(
    name: 'asdf', image: 'Assets/images/conan_doyle_book.png', owned: true);

class _MyBooksScreenState extends State<MyBooksScreen> {
  @override
  Widget build(BuildContext context) {
    final myBooksRepository = RepositoryProvider.of<MyBooksRepository>(context);

    List<Widget> listBook = [];
    for (int i = 0; i < myBooksRepository.myBooks.length; i += 2) {
      Row row = Row(children: [
        BooksVerticalContainer(
          onTap: () {
            widget.onTap(book, context);
          },
          book: myBooksRepository.myBooks[i],
        ),
        const SizedBox(
          width: 30,
        ),
        if (listBook.length != i) ...[
          BooksVerticalContainer(
            onTap: () {
              widget.onTap(book, context);
            },
            book: myBooksRepository.myBooks[i + 1],
          ),
        ]
      ]);
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
                  return SizedBox(height: 1000);
                } else if (state is MyBooksFailState) {
                  listBook == [];
                  return Row(
                    children: [
                      Text('проблем'),
                      SizedBox(height: 1000),
                    ],
                  );
                } else if (state is MyBooksSuccessState) {
                  return Column(
                    children: listBook.reversed.toList(),
                  );
                }

                return SizedBox(height: 1000,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
