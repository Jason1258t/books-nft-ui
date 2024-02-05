part of 'api_service.dart';

class BooksService with MyApiMethods {
  /// [_books] выдает книги пользователя а [_allBooks] все какие есть
  static const String _books = '/user/my-books/books';
  static String Function(int id) get _bookInfo => (id) => "/book/$id/preview";
  static String Function(int id) get _bookDetails => (int id) => '/book/$id/detail';
  BooksService({required Dio dio_}) {
    dio = dio_;
  }


  Future getBookInfo(int bookId) async => await get(_bookInfo(bookId));

  Future getBookDetails(int bookId) async => await get(_bookDetails(bookId));

  Future getMyBooks() async => await get(_books);
}
