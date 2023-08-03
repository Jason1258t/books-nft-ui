import 'package:nft/models/collection.dart';
import 'package:nft/services/api_service/api_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/shelf.dart';
import '../../my_books/data/my_books_repository.dart';

class StoreRepository {
  ApiService _apiService;

  StoreRepository({required ApiService apiService}) : _apiService = apiService;

  BehaviorSubject<LoadingStateEnum> saleCollectionState =
      BehaviorSubject<LoadingStateEnum>.seeded(LoadingStateEnum.loading);

  BehaviorSubject<bool> saleCollectionUpdateStream =
      BehaviorSubject<bool>.seeded(false);

  List<Collection> sailCollection = [];

  Future getStoreCollections() async {
    saleCollectionState.add(LoadingStateEnum.loading);
    try {
      sailCollection = [];

      final data = await _apiService.books.getAllCollections();
      for (var json in data) {
        print(json['details']['genre']);
        sailCollection.add(Collection.fromJson(
          json,
        ));
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
