import 'dart:convert';

import 'package:polytech_visits/models/user.dart';
import 'package:polytech_visits/services/network_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final _networkService = NetworkService();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> isAuth() async {
    final SharedPreferences prefs = await _prefs;
    final userId = prefs.getInt('user_id');
    final isAuth = userId != null;
    return isAuth;
  }

  Future<Map<String, dynamic>> login(String login, String password) async {
    var response = await _networkService.login(login, password);
    return response;
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
  }

  Future<void> setUserId(int userId) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt('user_id', userId);
  }

  Future<int?> getUserId() async {
    final SharedPreferences prefs = await _prefs;
    final int? id = prefs.getInt('user_id');
    return id;
  }

  Future<void> setUserToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('token', token);
  }

  Future<String?> getUserToken() async {
    final SharedPreferences prefs = await _prefs;
    final String? token = prefs.getString('token');
    return token;
  }

  Future<void> setUserToCache(User user) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('user', jsonEncode(user.toJson()));
  }

  Future<User?> getUserFromCache() async {
    final SharedPreferences prefs = await _prefs;
    final userString = prefs.getString('user');
    final user =
        userString != null ? User.fromJson(jsonDecode(userString)) : null;
    return user;
  }
}
