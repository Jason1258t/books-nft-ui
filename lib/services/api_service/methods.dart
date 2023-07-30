part of 'api_service.dart';

mixin class MyApiMethods {
  Dio dio = Dio();

  Future get(String url) async {
    try {
      final res = await dio.get(url);
      return res.data;
    } catch (e) {
      log(url);
      rethrow;
    }
  }

  Future post(String url, {dynamic data}) async {
    try {
      final res = await dio.post(url, data: data);
      return res.data;
    } catch (e) {
      log(url);
      rethrow;
    }
  }

  Future delete(String url) async {
    try {
      final res = await dio.delete(url);
      return res.data;
    } catch (e) {
      log(url);
      rethrow;
    }
  }

  void refreshDio(Dio newDio) => dio = newDio;
}