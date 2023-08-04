import 'package:nft/models/shelf.dart';

import 'book_position.dart';

class Wardrobe {
  late final String id;
  List<Book> availableBooks = [];
  List<ShelfData> shelves = [];

  bool contains(String id) {
    for (Book book in availableBooks) {
      if (book.id == id) return true;
    }
    return false;
  }

  BookPosition? findBook(String id) {
    for (ShelfData shelf in shelves) {
      if (!shelf.isLocked) {
        int index = 0;
        for (var book in shelf.booksData) {
          if (book is Book && book.id == id) {
            return BookPosition(shelf: shelf.shelfId, index: index);
          }
          index++;
        }
      }
    }
    return null;
  }

  BookPosition? getEmptyPlace() {
    for (ShelfData shelfData in shelves) {
      int index = 0;
      for (var place in shelfData.booksData) {
        if (place is BookPosition) {
          return BookPosition(shelf: shelfData.shelfId, index: index);
        }
        index++;
      }
    }
    return null;
  }
}
