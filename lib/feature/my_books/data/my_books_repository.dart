import 'package:nft/services/api_service.dart';

import '../../../models/book.dart';

class MyBooksRepository {
  final ApiService _apiService;

  MyBooksRepository({required ApiService apiService})
      : _apiService = apiService;

  List<Book> myBooks = [];

  Future getMyBooks() async {
    final data = await _apiService.books.getBooks();
    myBooks.clear();
    for (var json in data) {
      myBooks.add(Book.fromJson(json, true));
    }
  }
}
