import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Auth {
  Dio dio;

  static const _signup = '/auth/signup';
  static const _code = '/auth/code';
  static const _login = '/auth/login';

  Auth({required this.dio});

  Future signUp(String email) async {
    final res = await dio.post(_signup, data: {'email': email});
    return res.data;
  }

  /// вызывает метод получения кодв
  Future getCode(String email) async {
    final res = await dio.post(_code, data: {'email': email});
    return res.data;
  }

  /// производит авторизацию и возврвщает токен
  Future login(String email, int code) async {
    final res = await dio.post(_login, data: {'email': email, 'code': code});
    log('------------------------- ${res.data}');
    return res.data['token'];
  }

  /// получает статы пользователя после авторизации
  Future<Map> getUserProperties() async {
    final res = await dio.get('/users/user_properties');
    log(res.data.toString());
    return res.data;
  }
}

class BooksService {
  Dio dio;

  static const String _books = '/books/get';
  static const String _allBooks = '/books/get_all';

  static const String _allCollections = '/collections/get_all';
  static const String _collectionById = '/collections/get';

  /// чтобы это не значило
  static const String _createShelf = '/bookshelves/create';

  static const String _availableBooks = '/bookshelves/get_available_books';
  static const String _getBookcase = '/bookshelves/get_bookshelf';
  static const String _buyShelf = '/bookshelves/buy_shelf';
  static const String _buyPlace = '/bookshelves/buy_place';
  static const String _removeBook = '/bookshelves/remove_book';
  static const String _placeBook = '/bookshelves/place_book';

  BooksService({required this.dio});

  Future getAllBooks() async {
    final res = await dio.get(_allBooks);
    return res.data;
  }

  Future getBooks() async {
    final res = await dio.get(_books);
    return res.data;
  }

  Future getAllCollections() async {
    final res = await dio.get(_allCollections);
    return res.data;
  }

  Future getCollectionById(String id) async {
    final res = await dio.get('$_collectionById/%id');
    return res.data;
  }
}

class ApiService {
  String? _token;
  late Auth auth;
  late BooksService books;

  final Dio _dio =
      Dio(BaseOptions(baseUrl: dotenv.get('BASE_SERVER_URL'), headers: {
    'Content-Type': 'application/json',
  }));

  ApiService() : super() {
    auth = Auth(dio: _dio);
    books = BooksService(dio: _dio);
  }

  _updateAllServices() {
    auth.dio = _dio;
    books.dio = _dio;
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
    _updateAllServices();
  }

  /// сносит токен при выходе с аккаунта
  void logout() {
    _dio.options.headers = {'Content-Type': 'application/json'};
    _updateAllServices();
  }
}
