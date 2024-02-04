import 'dart:developer';

import 'package:nft/services/api_service/api_service.dart';
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
    log(token);
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
    prefs.setString(tokenKey, token);
  }

  Future logout() async {
    final prefs = await _prefs;
    await prefs.clear();
    _apiService.logout();
    appState.add(AppStateEnum.unAuth);
  }

  Future _auth(String jwt) async {
    try {
      await _apiService.setToken(jwt);
      await _saveToken(jwt);

      try {
        _apiService.bookshelves.createWardrobe();
      } catch (e) {}
      appState.add(AppStateEnum.auth);
    } catch (e) {
      appState.add(AppStateEnum.unAuth);
      rethrow;
    }
  }

  Future getCode(String email) async => await _apiService.auth.getCode(email);

  Future login(String email, int code) async {
    final jwt = await _apiService.auth.login(email, code);
    print(jwt);

    await _auth(jwt);
  }
  
  Future deleteAccount() async {
    await _apiService.auth.deleteAccount();
    await logout();
  }
}
