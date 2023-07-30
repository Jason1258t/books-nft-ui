part of 'api_service.dart';

class UserService with MyApiMethods {
  static const String _properties = '/users/user_properties';
  static const String _indicators = '/users/user_indicators';
  static const String _lvlUp = 'users/lvl_up';

  UserService({required Dio dio_}) {
    dio = dio_;
  }

  Future getProperties() async => get(_properties);

  Future getIndicators() async => get(_indicators);
}
