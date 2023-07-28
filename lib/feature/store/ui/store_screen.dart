import 'package:flutter/material.dart';
import 'package:nft/models/books_category.dart';

import '../../../models/book.dart';
import '../../../widget/custom_scrollers/custom_category_scroller.dart';
import '../../../widget/switch/custom_switch_categories.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

List<BooksCategory> booksCategories = [
  BooksCategory(name: 'Economy', books: [
    Book(name: 'asdf', image: 'Assets/images/conan_doyle_book.png'),
    Book(name: 'asdf', image: 'Assets/images/conan_doyle_book.png'),
    Book(name: 'asdf', image: 'Assets/images/conan_doyle_book.png'),
    Book(name: 'asdf', image: 'Assets/images/conan_doyle_book.png'),
  ]),
  BooksCategory(name: 'Fantasy', books: [
    Book(name: 'asdf', image: 'Assets/images/conan_doyle_book.png'),
    Book(name: 'asdf', image: 'Assets/images/conan_doyle_book.png'),
    Book(name: 'asdf', image: 'Assets/images/conan_doyle_book.png'),
    Book(name: 'asdf', image: 'Assets/images/conan_doyle_book.png'),
  ]),
  BooksCategory(name: 'Romantic', books: [
    Book(name: 'asdf', image: 'Assets/images/conan_doyle_book.png'),
    Book(name: 'asdf', image: 'Assets/images/conan_doyle_book.png'),
    Book(name: 'asdf', image: 'Assets/images/conan_doyle_book.png'),
    Book(name: 'asdf', image: 'Assets/images/conan_doyle_book.png'),
  ]),
];

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomSwitchCategories(),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: booksCategories
                    .map((e) => CustomCategoryScroller(
                          category: e,
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
