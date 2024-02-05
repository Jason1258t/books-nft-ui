part of 'api_service.dart';

class CollectionsService with MyApiMethods {
  static String Function(int) get _collectionById => (int id) => '/store/collection/$id';
  static String Function(int) get _collectionDetailById => (int id) => '/collection/$id/detail';

  CollectionsService({required Dio dio_}) {
    dio = dio_;
  }

  Future getCollectionById(int collectionId) async => await get(_collectionById(collectionId));

  Future getCollectionDetailById(int collectionId) async => await get(_collectionDetailById(collectionId));
}
