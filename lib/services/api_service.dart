import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/book_position.dart';

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

class BooksService with MyApiMethods {
  /// [_books] выдает книги пользователя а [_allBooks] все какие есть
  static const String _books = '/books/get';
  static const String _allBooks = '/books/get_all';

  static const String _allCollections = '/collections/get_all';
  static const String _collectionById = '/collections/get';

  /// создает шкаф, потому что блять саня рещил что после регистрации
  /// пользователя шкаф ему делать не обязательно
  static const String _createShelf = '/bookshelves/create';

  /// [_availableBooks] дает книги которые можно поставить так понимаю
  static const String _availableBooks = '/bookshelves/get_available_books';

  /// выдает весь шкаф нахуй
  static const String _getBookcase = '/bookshelves/get_bookshelf';

  static const String _buyShelf = '/bookshelves/buy_shelf';
  static const String _buyPlace = '/bookshelves/buy_place';

  static const String _removeBook = '/bookshelves/remove_book';
  static const String _placeBook = '/bookshelves/place_book';

  BooksService({required Dio dio_}) {
    dio = dio_;
  }

  /// только после регистрации
  Future createWardrobe() async => await post(_createShelf);

  Future getAllBooks() async => await get(_allBooks);

  Future getMyBooks() async {
    return await get(_books);
  }

  Future getWardrobe() async => await get(_getBookcase);

  Future getAvailableBooks() async => await get(_availableBooks);

  Future buyShelf() async => await post(_buyShelf);

  Future buyPlace(String shelfId) async =>
      await post(_buyPlace, data: {'shelf': shelfId});

  Future placeBook(BookPosition position, String bookId) async => await post(
      _placeBook,
      data: {"shelf": position.shelf, "index": position.index, "book": bookId});

  Future removeBook(BookPosition position) async =>
      await post(_removeBook, data: position.toJson);

  Future getAllCollections() async => await get(_allCollections);

  Future getCollectionById(String id) async =>
      await get('$_collectionById/%id');
}

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

class ApiService {
  String? _token;
  late Auth auth;
  late BooksService books;
  late UserService user;

  final Dio _dio =
      Dio(BaseOptions(baseUrl: dotenv.get('BASE_SERVER_URL'), headers: {
    'Content-Type': 'application/json',
  }));

  ApiService() : super() {
    auth = Auth(dio_: _dio);
    books = BooksService(dio_: _dio);
    user = UserService(dio_: _dio);
  }

  _updateAllServices() {
    auth.refreshDio(_dio);
    books.refreshDio(_dio);
    user.refreshDio(_dio);
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
