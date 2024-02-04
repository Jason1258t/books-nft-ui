part of 'api_service.dart';

class BooksService with MyApiMethods {
  /// [_books] выдает книги пользователя а [_allBooks] все какие есть
  static const String _books = '/user/my-books/books';
  static final String Function(int) _bookInfo = (int id) => "/book/$id/preview";
  static final String Function(int) _bookDetails = (int id) => '/book/$id/preview';
  static const String _allBooks = '/books/get_all';
  static const String _booksAvailableToBuy = '/books/get_available';
  static const String _buyBook = '/books/buy/';

  BooksService({required Dio dio_}) {
    dio = dio_;
  }

  Future getAllBooks() async => await get(_allBooks);

  Future getBookInfo(int book_id) async => await get(_bookInfo(book_id));

  Future getBookDetails(int book_id) async => await get(_bookInfo(book_id));

  Future getMyBooks() async => await get(_books);

  Future getAvailableToBuyBooks() async => await get(_booksAvailableToBuy);

  Future buyBook(String bookId) async => await post('$_buyBook$bookId');
}
