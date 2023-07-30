part of 'api_service.dart';

class BooksService with MyApiMethods {
  /// [_books] выдает книги пользователя а [_allBooks] все какие есть
  static const String _books = '/books/get';
  static const String _allBooks = '/books/get_all';
  static const String _booksAvailableToBuy = '/books/get_available';

  static const String _allCollections = '/collections/get_all';
  static const String _collectionById = '/collections/get';

  /// создает шкаф, потому что блять саня рещил что после регистрации
  /// пользователя шкаф ему делать не обязательно
  static const String _createShelf = '/bookshelves/create';

  /// [_availableBooks] дает книги которые можно поставить так понимаю
  static const String _availableBooks = '/bookshelves/get_available_books';

  /// выдает весь шкаф нахуй
  static const String _getBookcase = '/bookshelves/get_bookshelf';

  static const String _buyShelf = '/bookshelves/buy_shelf';
  static const String _buyPlace = '/bookshelves/buy_place';

  static const String _removeBook = '/bookshelves/remove_book';
  static const String _placeBook = '/bookshelves/place_book';

  BooksService({required Dio dio_}) {
    dio = dio_;
  }

  /// только после регистрации
  Future createWardrobe() async => await post(_createShelf);

  Future getAllBooks() async => await get(_allBooks);

  Future getMyBooks() async {
    return await get(_books);
  }

  Future getWardrobe() async => await get(_getBookcase);

  Future getAvailableBooks() async => await get(_availableBooks);

  Future getAvailableToBuyBooks() async => await get(_booksAvailableToBuy);

  Future buyShelf() async => await post(_buyShelf);

  Future buyPlace(String shelfId) async =>
      await post(_buyPlace, data: {'shelf': shelfId});

  Future placeBook(BookPosition position, String bookId) async => await post(
      _placeBook,
      data: {"shelf": position.shelf, "index": position.index, "book": bookId});

  Future removeBook(BookPosition position) async =>
      await post(_removeBook, data: position.toJson);

  Future getAllCollections() async => await get(_allCollections);

  Future getCollectionById(String id) async =>
      await get('$_collectionById/%id');
}
