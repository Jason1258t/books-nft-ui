import 'package:nft/models/book_position.dart';

part 'book.dart';

class ShelfData {
  bool isLocked;
  List<ShelfPlaceData?> booksData;
  final String shelfId;

  ShelfData(
      {required this.booksData, this.isLocked = false, required this.shelfId})
      : super() {
    assert(booksData.length <= 7, 'the number of books is more than 7');
  }

  ShelfData.fromJson(Map<String, dynamic> json)
      : isLocked = false,
        shelfId = json['id'],
        booksData = [] {
    int index = 0;
    for (var item in json['books']) {
      if (item != null) {
        booksData.add(Book.fromJson(item, true, available: false));
      } else {
        booksData.add(BookPosition(shelf: shelfId, index: index));
      }
      index++;
    }
  }
}
