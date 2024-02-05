import 'package:nft/models/books_genre.dart';
import 'package:nft/models/collectio_detail.dart';
import 'package:nft/models/collection.dart';
import 'package:nft/services/api_service/api_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../my_books/data/my_books_repository.dart';

class StoreRepository {
  final ApiService _apiService;

  StoreRepository({required ApiService apiService}) : _apiService = apiService;

  BehaviorSubject<LoadingStateEnum> saleCollectionState =
      BehaviorSubject<LoadingStateEnum>.seeded(LoadingStateEnum.loading);

  BehaviorSubject<LoadingStateEnum> collectionInfo =
      BehaviorSubject<LoadingStateEnum>.seeded(LoadingStateEnum.loading);

  BehaviorSubject<LoadingStateEnum> collectionDetail =
      BehaviorSubject<LoadingStateEnum>.seeded(LoadingStateEnum.loading);

  List<BooksGenre> sortedCollections = [];

  Collection? currentCollection;
  CollectionDetails? currentCollectionDetails;

  Future getStoreCollections() async {
    saleCollectionState.add(LoadingStateEnum.loading);
    try {
      sortedCollections = [];

      final data = await _apiService.storeService.getStorePreview();
      List<String> genres = [];

      for(var genre in data['genres']){
        genres.add(genre.toString());
      }

      for (var genre in genres) {
        sortedCollections.add(BooksGenre.fromJson(data['collections'][genre], genre));
      }

      saleCollectionState.add(LoadingStateEnum.success);
    } catch (e) {
      saleCollectionState.add(LoadingStateEnum.fail);
      rethrow;
    }
  }

  void getCollectionById(int collectionId) async {
    collectionInfo.add(LoadingStateEnum.loading);
    try {
      final data = await _apiService.collections.getCollectionById(collectionId);

      currentCollection = Collection.fromJson(data);

      collectionInfo.add(LoadingStateEnum.success);
    } catch (e) {
      collectionInfo.add(LoadingStateEnum.fail);
      rethrow;
    }
  }

  void getCollectionDetailById(int collectionId) async{
    collectionDetail.add(LoadingStateEnum.loading);
    try {
      final data = await _apiService.collections.getCollectionDetailById(collectionId);

      currentCollectionDetails = CollectionDetails.fromJson(data);

      collectionDetail.add(LoadingStateEnum.success);
    } catch (e) {
      collectionDetail.add(LoadingStateEnum.fail);
      rethrow;
    }
  }

  BooksGenre? searchGenreByName(String name) {
    for (BooksGenre genre in sortedCollections) {
      if (genre.name == name) return genre;
    }

    return null;
  }
}
