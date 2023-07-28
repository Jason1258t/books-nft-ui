import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  static const _signup = '/auth/signup';
  static const _code = '/auth/code';
  static const _login = 'auth/login';

  String? _token;

  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'https://90.156.205.207:4000', headers: {
    'Content-Type': 'application/json',
  }));

  /// чисто создает запись потос один хер [getCode], [login]
  Future<String> signUp(String email) async {
    final res = await _dio.post(_signup, data: {'email': email});
    return res.data;
  }

  /// вызывает метод получения кодв
  Future<String> getCode(String email) async {
    final res = await _dio.post(_code, data: {'email': email});
    return res.data;
  }

  /// производит авторизацию и возврвщает токен
  Future<String> login(String email, int code) async {
    final res = await _dio.post(_login, data: {'email': email, 'code': code});
    setToken('Bearer ${res.data}');
    return res.data;
  }


  /// получает статы пользователя после авторизации
  Future<Map> getUserProperties() async {
    final res = await _dio.get('/users/user_properties');
    log(res.data.toString());
    return res.data;
  }


  /// ставит token в dio
  Future setToken(String token) async {
    _token = token;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': _token
    };
    await getUserProperties();
  }
}
