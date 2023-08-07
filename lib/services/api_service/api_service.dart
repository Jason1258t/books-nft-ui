import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../models/book_position.dart';

part 'auth.dart';
part 'books.dart';
part 'bookshelves.dart';
part 'collections.dart';
part 'methods.dart';
part 'users.dart';

class ApiService {
  late Auth auth;
  late BooksService books;
  late UserService user;
  late CollectionsService collections;
  late BookshelvesService bookshelves;

  final Dio _dio =
      Dio(BaseOptions(baseUrl: dotenv.get('BASE_SERVER_URL'), headers: {
    'Content-Type': 'application/json',
  }));

  ApiService() : super() {
    auth = Auth(dio_: _dio);
    books = BooksService(dio_: _dio);
    collections = CollectionsService(dio_: _dio);
    bookshelves = BookshelvesService(dio_: _dio);
    user = UserService(dio_: _dio);
  }

  _updateAllServices() {
    auth.refreshDio(_dio);
    books.refreshDio(_dio);
    user.refreshDio(_dio);
    collections.refreshDio(_dio);
    bookshelves.refreshDio(_dio);
  }

  /// получает статы пользователя после авторизации
  Future<Map> getUserProperties() async {
    try {
      final res = await _dio.get('/users/user_properties');
      log(res.data.toString());
      return res.data;
    } catch (e) {
      log('user_properties');
      rethrow;
    }
  }

  /// ставит token в dio
  Future setToken(String token) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    await getUserProperties();
    _updateAllServices();
  }

  /// сносит токен при выходе с аккаунта
  void logout() {
    _dio.options.headers = {'Content-Type': 'application/json'};
    _updateAllServices();
  }
}
