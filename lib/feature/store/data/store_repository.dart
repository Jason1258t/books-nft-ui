import 'package:nft/models/collection.dart';
import 'package:nft/services/api_service/api_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../my_books/data/my_books_repository.dart';

class StoreRepository {
  ApiService _apiService;

  StoreRepository({required ApiService apiService}) : _apiService = apiService;

  BehaviorSubject<LoadingStateEnum> saleCollectionState =
      BehaviorSubject<LoadingStateEnum>.seeded(LoadingStateEnum.loading);

  BehaviorSubject<bool> saleCollectionUpdateStream =
      BehaviorSubject<bool>.seeded(false);

  List<Collection> sailCollection = [];
  List<BooksGenre> sortedCollections = [];

  Future getStoreCollections() async {
    saleCollectionState.add(LoadingStateEnum.loading);
    try {
      sailCollection = [];

      final data = await _apiService.collections.getGenres();
      for (var json in data) {
        sortedCollections.add(BooksGenre.fromJson(json));
      }

      saleCollectionUpdateStream.add(true);
      saleCollectionState.add(LoadingStateEnum.success);
    } catch (e) {
      saleCollectionState.add(LoadingStateEnum.fail);
      rethrow;
    }
  }

  Future buyCollection(String collectionId) async {
    await _apiService.books.buyBook(collectionId);
  }

  Collection? searchBookById(String id) {
    for (Collection book in sailCollection) {
      if (book.id == id) return book;
    }
    return null;
  }
}
