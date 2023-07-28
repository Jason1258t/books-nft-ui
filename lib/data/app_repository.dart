import 'dart:developer';

import 'package:nft/servi%D1%81e/api_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppStateEnum { wait, auth, unAuth }

const String tokenKey = 'token';

class AppRepository {
  final ApiService _apiService;
  final _prefs = SharedPreferences.getInstance();

  AppRepository({required ApiService apiService}) : _apiService = apiService;

  BehaviorSubject<AppStateEnum> appState =
      BehaviorSubject<AppStateEnum>.seeded(AppStateEnum.wait);

  void checkLogin() async {
    final prefs = await _prefs;
    final String token = prefs.getString(tokenKey) ?? '';

    if (token.isEmpty) {
      appState.add(AppStateEnum.unAuth);
    } else {
      try {
        await _apiService.setToken(token);
        appState.add(AppStateEnum.auth);
      } catch (e) {
        appState.add(AppStateEnum.unAuth);
      }
    }
  }

  Future _saveToken(String token) async {
    final prefs = await _prefs;
    prefs.setString(tokenKey, 'Bearer $token');
  }

  Future logout() async {
    final prefs = await _prefs;
    await prefs.clear();
    _apiService.logout();
    appState.add(AppStateEnum.unAuth);
  }

  _auth(Future method) async {
    try {
      final result = await method;
      log(result.toString());
      await _saveToken(result.toString());
      appState.add(AppStateEnum.auth);
    } catch (e) {
      appState.add(AppStateEnum.unAuth);
      rethrow;
    }
  }

  /// вызывает метод создания email на сервере и отправляет код
  Future getCodeOnSignUp(String email) async {
    await _apiService.signUp(email);
    await getCode(email);
  }

  Future getCode(String email) async => await _apiService.getCode(email);

  Future login(String email, int code) async {
    _auth(_apiService.login(email, code));
  }
}
