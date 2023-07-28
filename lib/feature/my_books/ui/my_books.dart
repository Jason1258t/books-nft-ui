import 'package:flutter/material.dart';

import '../../../widget/containers/books_vertical_container.dart';
import '../../../widget/switch/custom_switch.dart';

class MyBooksScreen extends StatefulWidget {
  const MyBooksScreen({super.key});

  @override
  State<MyBooksScreen> createState() => _MyBooksScreenState();
}

List<int> list = [1, 2, 34, 4, 5, 6, 7, 8, 89];

class _MyBooksScreenState extends State<MyBooksScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> listBook = [];
    for(int i = 0; i < list.length; i+=2 ){
      Row row = Row(
          children: [
            const BooksVerticalContainer(),
            const SizedBox(width: 30,),
            if (listBook.length != i) ...[const BooksVerticalContainer(),]]);
      listBook.add(row);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          const CustomToggleSwitch(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: listBook.reversed.toList(),
            ),
          ),
        ],
      ),
    );
  }
}
