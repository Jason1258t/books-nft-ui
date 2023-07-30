part of 'api_service.dart';

class Auth with MyApiMethods {
  static const _signup = '/auth/signup';
  static const _code = '/auth/code';
  static const _login = '/auth/login';
  static const _delete = '/auth/delete';

  Auth({required Dio dio_}) {
    dio = dio_;
  }

  Future signUp(String email) async =>
      await post(_signup, data: {'email': email});

  /// вызывает метод получения кодв
  Future getCode(String email) async =>
      await post(_code, data: {'email': email});

  /// производит авторизацию и возврвщает токен
  Future login(String email, int code) async {
    final data = await post(_login, data: {'email': email, 'code': code});
    log('------------------------- $data');
    return data['token'];
  }

  Future deleteAccount() async => delete(_delete);

  /// получает статы пользователя после авторизации
  Future<Map> getUserProperties() async {
    final data = await get('/users/user_properties');
    log(data.toString());
    return data;
  }
}
