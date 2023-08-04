part of 'api_service.dart';

class BooksService with MyApiMethods {
  /// [_books] выдает книги пользователя а [_allBooks] все какие есть
  static const String _books = '/books/get';
  static const String _allBooks = '/books/get_all';
  static const String _booksAvailableToBuy = '/books/get_available';
  static const String _buyBook = '/books/buy/';

  BooksService({required Dio dio_}) {
    dio = dio_;
  }

  Future getAllBooks() async => await get(_allBooks);

  Future getMyBooks() async {
    return await get(_books);
  }

  Future getAvailableToBuyBooks() async => await get(_booksAvailableToBuy);

  Future buyBook(String bookId) async => await post('$_buyBook$bookId');
}
