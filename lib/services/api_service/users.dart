part of 'api_service.dart';

class UserService with MyApiMethods {
  static const String _properties = '/user/self';

  UserService({required Dio dio_}) {
    dio = dio_;
  }

  Future getProperties() async => get(_properties);
}
