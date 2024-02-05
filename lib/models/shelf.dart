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
    int maxCount = json['maxCount'];
    for (int i = 0; i < maxCount; i++) {
      var item = json['books'][i];
      if (item != null) {
        booksData.add(Book.fromJson(item, true));
      } else {
        booksData.add(BookPosition(shelf: shelfId, index: i));
      }
    }
  }
}
