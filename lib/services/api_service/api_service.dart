import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../models/book_position.dart';

part 'auth.dart';
part 'books.dart';
part 'bookshelves.dart';
part 'collections.dart';
part 'methods.dart';
part 'users.dart';
part 'store.dart';

class ApiService {
  late Auth auth;
  late BooksService books;
  late UserService user;
  late CollectionsService collections;
  late BookshelvesService bookshelves;
  late StoreService storeService;

  final Dio _dio =
      Dio(BaseOptions(baseUrl: dotenv.get('BASE_SERVER_URL'), headers: {
    'Content-Type': 'application/json',
  }))..interceptors.add(PrettyDioLogger());

  ApiService() : super() {
    auth = Auth(dio_: _dio);
    books = BooksService(dio_: _dio);
    collections = CollectionsService(dio_: _dio);
    bookshelves = BookshelvesService(dio_: _dio);
    user = UserService(dio_: _dio);
    storeService = StoreService(dio_: _dio);
  }

  _updateAllServices() {
    auth.refreshDio(_dio);
    books.refreshDio(_dio);
    user.refreshDio(_dio);
    collections.refreshDio(_dio);
    bookshelves.refreshDio(_dio);
    storeService.refreshDio(_dio);
  }

  /// ставит token в dio
  Future setToken(String token) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    _updateAllServices();
  }

  /// сносит токен при выходе с аккаунта
  void logout() {
    _dio.options.headers = {'Content-Type': 'application/json'};
    _updateAllServices();
  }
}
