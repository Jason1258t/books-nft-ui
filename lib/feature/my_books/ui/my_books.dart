import 'package:flutter/material.dart';

import '../../../widget/containers/books_container.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          const CustomToggleSwitch(),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: list.map((e) => const BooksContainer()).toList(),
          ),
        ],
      ),
    );
  }
}
