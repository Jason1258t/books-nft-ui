import 'package:nft/services/api_service.dart';

import '../../../models/shelf.dart';
import '../../../models/stats.dart';

class MyBooksRepository {
  final ApiService _apiService;

  late Wardrobe wardrobe;
  late Stats stats;

  MyBooksRepository({required ApiService apiService})
      : _apiService = apiService {
    wardrobe = Wardrobe();
    stats = Stats(energy: 0, intelligence: 0, luck: 0, strength: 0);
    getAvailableBooks();
  }

  List<Book> myBooks = [];

  Future getMyBooks() async {
    final data = await _apiService.books.getMyBooks();
    myBooks.clear();
    for (var json in data) {
      myBooks.add(Book.fromJson(json, true));
    }
  }

  Future getAvailableBooks() async {
    final data = await _apiService.books.getAvailableBooks();
    wardrobe.availableBooks.clear();
    for (var json in data) {
      wardrobe.availableBooks.add(Book.fromJson(json, true));
    }
  }
}

class Wardrobe {
  List<Book> availableBooks = [];
  List<ShelfData> shelves = [];


}
