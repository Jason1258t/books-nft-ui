part 'book.dart';

class ShelfData {
  bool isLocked;
  List<Book?> booksData;
  final String shelfId;

  ShelfData({required this.booksData, this.isLocked = false, required this.shelfId}) : super() {
    assert(booksData.length <= 7, 'the number of books is more than 7');
  }
}