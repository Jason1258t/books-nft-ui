part of 'api_service.dart';

class BookshelvesService with MyApiMethods {
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

  BookshelvesService({required Dio dio_}) {
    dio = dio_;
  }

  /// только после регистрации
  Future createWardrobe() async => await post(_createShelf);

  Future getWardrobe() async => await get(_getBookcase);

  Future getAvailableBooks() async => await get(_availableBooks);

  Future buyShelf() async => await post(_buyShelf);

  Future buyPlace(String shelfId) async =>
      await post(_buyPlace, data: {'shelf': shelfId});

  Future placeBook(BookPosition position, String bookId) async => await post(
      _placeBook,
      data: {"shelf": position.shelf, "index": position.index, "book": bookId});

  Future removeBook(BookPosition position) async =>
      await post(_removeBook, data: position.toJson);
}
