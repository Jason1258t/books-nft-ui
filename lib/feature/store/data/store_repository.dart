import 'package:nft/services/api_service/api_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/shelf.dart';
import '../../my_books/data/my_books_repository.dart';

class StoreRepository {
  ApiService _apiService;

  StoreRepository({required ApiService apiService}) : _apiService = apiService;

  BehaviorSubject<LoadingStateEnum> saleBooksState =
      BehaviorSubject<LoadingStateEnum>.seeded(LoadingStateEnum.loading);

  List<Book> saleBooks = [];

  Book? searchBook(String id) {
    for (Book book in saleBooks) {
      if (book.id == id) return book;
    }
    return null;
  }

  Future getSaleBooks() async {
    saleBooksState.add(LoadingStateEnum.loading);
    try {
      final data = await _apiService.books.getAvailableToBuyBooks();
      for (var json in data) {
        saleBooks.add(Book.fromJson(
          json,
          false,
          available: false,
        ));
      }
      saleBooksState.add(LoadingStateEnum.success);
    } catch (e) {
      saleBooksState.add(LoadingStateEnum.fail);
      rethrow;
    }
  }
}
