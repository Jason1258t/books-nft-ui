part of 'api_service.dart';


class StoreService with MyApiMethods {
  static const String _storePreview = '/store/preview';
  static const String _storeList = '/store/list';

  StoreService({required Dio dio_}) {
    dio = dio_;
  }


  Future getStorePreview() async => await get(_storePreview);

  Future getStoreList() async => await get(_storeList);
}
