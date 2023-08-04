part of 'api_service.dart';

class CollectionsService with MyApiMethods {
  static const String _allCollections = '/collections/get_all';
  static const String _collectionById = '/collections/get';
  static const String _collectionsGenres = '/collections/genres';
  static const String _collectionsByGenre = '/collections/genres';

  CollectionsService({required Dio dio_}) {
    dio = dio_;
  }

  Future getAllCollections() async => await get(_allCollections);

  Future getCollectionById(String id) async =>
      await get('$_collectionById/$id');

  Future getGenres() async => get(_collectionsGenres);

  Future getCollectionsByGenre(String genre) async =>
      get('$_collectionsByGenre/$genre');
}
