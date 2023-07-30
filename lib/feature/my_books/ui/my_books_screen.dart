import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft/feature/my_books/bloc/books/my_books_cubit.dart';

import '../../../models/shelf.dart';
import '../../../utils/dialogs.dart';
import '../../../widget/containers/books_vertical_container.dart';
import '../../../widget/switch/custom_switch.dart';

class MyBooksScreen extends StatefulWidget {
  const MyBooksScreen({super.key, required this.onTap, required this.books});

  final Function(Book, BuildContext) onTap;
  final List<Book> books;

  @override
  State<MyBooksScreen> createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends State<MyBooksScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    List<Widget> listBook = [];
    for (int i = 0; i < widget.books.length; i += 2) {
      Row row = Row(children: [
        BooksVerticalContainer(
          onTap: () {
            widget.onTap(widget.books[i], context);
          },
          book: widget.books[i],
        ),
        const SizedBox(
          width: 20,
        ),
      ]);

      try {
        row.children.add(
          BooksVerticalContainer(
            onTap: () {
              widget.onTap(widget.books[i + 1], context);
            },
            book: widget.books[i + 1],
          ),
        );
      } catch (e) {}

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
                  return SizedBox(height: height);
                } else if (state is MyBooksFailState) {
                  listBook == [];
                  return Row(
                    children: [
                      const Text('проблем'),
                      SizedBox(height: height - 200),
                    ],
                  );
                } else if (state is MyBooksSuccessState) {
                  return listBook.length > 2
                      ? Column(
                          children: listBook.toList(),
                        )
                      : Column(
                          children: [
                            Column(
                              children: listBook.toList(),
                            ),
                            SizedBox(
                              height: listBook.isNotEmpty ? 300 : height - 240,
                            )
                          ],
                        );
                }

                return SizedBox(
                  height: height - 200,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
