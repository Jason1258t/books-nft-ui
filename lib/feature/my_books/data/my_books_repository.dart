import 'package:nft/models/book_position.dart';
import 'package:nft/services/api_service/api_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/book_view.dart';
import '../../../models/shelf.dart';
import '../../../models/stats.dart';
import '../../../models/wardrobe.dart';

enum LoadingStateEnum { wait, loading, success, fail }

class MyBooksRepository {
  final ApiService _apiService;

  late Wardrobe wardrobe;
  late UserStats userStats;

  int userLvl = 1;

  BookPosition? _savedPlace;

  /// требуетс для добавления книги в конкретную ячейку
  void savePlace(BookPosition newPlace) => _savedPlace = newPlace;

  /// полчучает сохраненную ячейку
  get savedPlace => _savedPlace;

  MyBooksRepository({required ApiService apiService})
      : _apiService = apiService;

  void initial() {
    wardrobe = Wardrobe();
    // getWardrobe().then((value) => getMyBooks());
    getMyBooks();
  }

  void clearWardrobe() {
    wardrobe = Wardrobe();
    wardrobeState.add(LoadingStateEnum.loading);
  }

  BehaviorSubject<LoadingStateEnum> wardrobeState =
      BehaviorSubject<LoadingStateEnum>.seeded(LoadingStateEnum.loading);
  BehaviorSubject<LoadingStateEnum> myBooksState =
      BehaviorSubject<LoadingStateEnum>.seeded(LoadingStateEnum.loading);
  BehaviorSubject<UserStats> userProperties = BehaviorSubject<UserStats>.seeded(
      UserStats(
          lvl: 1,
          stats: Stats(energy: 0, intelligence: 0, luck: 0, strength: 0),
          indicators: Indicators(0, 0, 0,0,0)));

  List<BookView> myBooks = [];

  Future getMyBooks() async {
    myBooksState.add(LoadingStateEnum.loading);
    try {
      final data = (await _apiService.books.getMyBooks())['books'];

      myBooks.clear();
      for (var json in data) {
        myBooks.add(BookView.fromJson(json));
      }
      myBooksState.add(LoadingStateEnum.success);
    } catch (e) {
      myBooksState.add(LoadingStateEnum.fail);
      rethrow;
    }
  }

  void _refreshMyBooks() async {
    // try {
    //   for (Book book in myBooks) {
    //     book.available = wardrobe.contains(book.id);
    //   }
    //   myBooksState.add(LoadingStateEnum.success);
    // } catch (e) {
    //   myBooksState.add(LoadingStateEnum.fail);
    // }
  }

  Future _getAvailableBooks() async {
    final data = await _apiService.bookshelves.getAvailableBooks();
    wardrobe.availableBooks.clear();
    for (var json in data['books']) {
      wardrobe.availableBooks.add(BookView.fromJson(json));
    }
  }

  Future _getShelves() async {
    final data = await _apiService.bookshelves.getWardrobe();
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
    await _apiService.bookshelves.placeBook(position, id);
    await getWardrobe();
    _refreshMyBooks();
  }

  Future removeBook(String id) async {
    await _apiService.bookshelves.removeBook(wardrobe.findBook(id)!);
    await getWardrobe();
    _refreshMyBooks();
  }

  Future getUserStats() async {
    final stats = _apiService.user.getProperties();

    await Future.wait([stats]).then((value) {
      userLvl = 0;
      userStats = UserStats(
          lvl: userLvl,
          stats: Stats.zero(),
          indicators: Indicators.fromJson(value[0]));

      userProperties.add(userStats);
    });
  }

  Future getWardrobe() async {
    try {
      Future booksLoading = _getAvailableBooks();
      Future shelvesLoading = _getShelves();
      Future userStatsLoading = getUserStats();
      await Future.wait([booksLoading, shelvesLoading, userStatsLoading]);
      wardrobeState.add(LoadingStateEnum.success);
    } catch (e) {
      wardrobeState.add(LoadingStateEnum.fail);
      rethrow;
    }
  }

  Future buyPlace(String shelfId) async {
    await _apiService.bookshelves.buyPlace(shelfId);
    await getWardrobe();
  }

  Future buyShelf() async {
    await _apiService.bookshelves.buyShelf();
    await getWardrobe();
  }
}
