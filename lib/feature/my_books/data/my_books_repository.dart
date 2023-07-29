import 'package:nft/models/book_position.dart';
import 'package:nft/services/api_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/shelf.dart';
import '../../../models/stats.dart';

enum LoadingStateEnum { wait, loading, success, fail }

class MyBooksRepository {
  final ApiService _apiService;

  late Wardrobe wardrobe;
  late UserStats userStats;

  BookPosition? _savedPlace;

  /// требуетс для добавления книги в конкретную ячейку
  void savePlace(BookPosition newPlace) => _savedPlace = newPlace;

  /// полчучает сохраненную ячейку
  get savedPlace => _savedPlace;

  MyBooksRepository({required ApiService apiService})
      : _apiService = apiService {
    wardrobe = Wardrobe();
    getWardrobe().then((value) => getMyBooks());
  }

  BehaviorSubject<LoadingStateEnum> wardrobeState =
      BehaviorSubject<LoadingStateEnum>.seeded(LoadingStateEnum.loading);
  BehaviorSubject<LoadingStateEnum> myBooksState =
      BehaviorSubject<LoadingStateEnum>.seeded(LoadingStateEnum.loading);

  List<Book> myBooks = [];

  Future getMyBooks() async {
    myBooksState.add(LoadingStateEnum.loading);
    try {
      final data = await _apiService.books.getMyBooks();
      myBooks.clear();
      for (var json in data) {
        myBooks.add(Book.fromJson(json, true,
            available: !wardrobe.contains(json['id'])));
      }
      myBooksState.add(LoadingStateEnum.success);
    } catch (e) {
      myBooksState.add(LoadingStateEnum.fail);
      rethrow;
    }
  }

  void _refreshMyBooks() async {
    try {
      for (Book book in myBooks) {
        book.available = !wardrobe.contains(book.bookId);
      }
      myBooksState.add(LoadingStateEnum.success);
    } catch (e) {
      myBooksState.add(LoadingStateEnum.fail);
    }
  }

  Future _getAvailableBooks() async {
    final data = await _apiService.books.getAvailableBooks();
    wardrobe.availableBooks.clear();
    for (var json in data) {
      wardrobe.availableBooks.add(Book.fromJson(json, true));
    }
  }

  Future _getShelves() async {
    final data = await _apiService.books.getWardrobe();
    wardrobe.shelves = [];
    for (var jsonShelf in data['shelves']) {
      wardrobe.shelves.add(ShelfData.fromJson(jsonShelf));
    }
    if (wardrobe.shelves.length < 3) {
      wardrobe.shelves
          .add(ShelfData(isLocked: true, booksData: [], shelfId: ''));
    }
  }

  Future placeBook({BookPosition? position, required String id}) async {
    position ??= wardrobe.getEmptyPlace();
    if (position == null) {
      throw Exception('no places');
    }
    await _apiService.books.placeBook(position, id);
    getWardrobe().then((value) => _refreshMyBooks());
  }

  Future removeBook(String id) async {
    await _apiService.books.removeBook(wardrobe.findBook(id)!);
    getWardrobe().then((value) => _refreshMyBooks());
  }

  Future _getUserStats() async {
    final stats = _apiService.user.getProperties();
    final indicators = _apiService.user.getIndicators();
    await Future.wait([stats, indicators]).then((value) => userStats =
        UserStats(
            stats: Stats.fromJson(value[0]),
            indicators: Indicators.fromJson(value[1])));
  }

  Future getWardrobe() async {
    try {
      Future booksLoading = _getAvailableBooks();
      Future shelvesLoading = _getShelves();
      Future userStatsLoading = _getUserStats();
      await Future.wait([booksLoading, shelvesLoading, userStatsLoading]);
    } catch (e) {
      wardrobeState.add(LoadingStateEnum.fail);
      rethrow;
    }
  }
}

class Wardrobe {
  late final String id;
  List<Book> availableBooks = [];
  List<ShelfData> shelves = [];

  bool contains(String id) {
    for (Book book in availableBooks) {
      if (book.bookId == id) return true;
    }
    return false;
  }

  BookPosition? findBook(String id) {
    for (ShelfData shelf in shelves) {
      if (!shelf.isLocked) {
        int index = 0;
        for (var book in shelf.booksData) {
          if (book is Book) {
            if (book.bookId == id) {
              return BookPosition(shelf: shelf.shelfId, index: index);
            }
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
        if (place == null) {
          return BookPosition(shelf: shelfData.shelfId, index: index);
        }
        index++;
      }
    }
    return null;
  }
}
