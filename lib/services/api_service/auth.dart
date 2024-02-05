part of 'api_service.dart';

class Auth with MyApiMethods {
  static const _code = '/auth/mail';
  static const _login = '/auth/login';
  static const _delete = '/auth/delete';

  Auth({required Dio dio_}) {
    dio = dio_;
  }

  /// вызывает метод получения кодв
  Future getCode(String email) async =>
      await post(_code, data: {'email': email});

  /// производит авторизацию и возврвщает токен
  Future login(String email, int code) async {
    final data = await post(_login, data: {'email': email, 'code': '$code'});

    return data['jwt'];
  }

  Future deleteAccount() async => delete(_delete);
}
