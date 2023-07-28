import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static const _signup = '/auth/signup';
  static const _code = '/auth/code';
  static const _login = '/auth/login';

  String? _token;

  final Dio _dio =
      Dio(BaseOptions(baseUrl: dotenv.get('BASE_SERVER_URL'), headers: {
    'Content-Type': 'application/json',
  }));

  /// чисто создает запись потос один хер [getCode], [login]
  Future signUp(String email) async {
    final res = await _dio.post(_signup, data: {'email': email});
    return res.data;
  }

  /// вызывает метод получения кодв
  Future getCode(String email) async {
    final res = await _dio.post(_code, data: {'email': email});
    return res.data;
  }

  /// производит авторизацию и возврвщает токен
  Future login(String email, int code) async {
    final res = await _dio.post(_login, data: {'email': email, 'code': code});
    log('------------------------- ${res.data}');
    await setToken('Bearer ${res.data['token']}');
    return res.data['token'];
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

  /// сносит токен при выходе с аккаунта
  void logout() => _dio.options.headers = {'Content-Type': 'application/json'};
}
