import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _favoriteMoviesKey = 'favoriteMovies';

  // Singleton Pattern
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();
  factory SharedPreferencesService() => _instance;

  SharedPreferencesService._internal();

  SharedPreferences? _preferences;

  // Inicializar SharedPreferences (solo una vez)
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Guardar el estado de autenticación
  Future<void> setLoggedIn(bool value) async {
    await _preferences?.setBool(_isLoggedInKey, value);
  }

  Future<bool> getLoggedIn() async {
    return _preferences?.getBool(_isLoggedInKey) ?? false;
  }

  // Guardar películas favoritas como lista de cadenas JSON
  Future<void> setFavoriteMovies(List<String> movies) async {
    await _preferences?.setStringList(_favoriteMoviesKey, movies);
  }

  // Recuperar las películas favoritas como una lista de objetos JSON
  Future<List<Map<String, dynamic>>> getFavoriteMovies() async {
    final jsonList = _preferences?.getStringList(_favoriteMoviesKey) ?? [];
    return jsonList.map((json) => jsonDecode(json) as Map<String, dynamic>).toList();
  }

  // Limpiar todas las preferencias (para logout)
  Future<void> clearAll() async {
    await _preferences?.clear();
  }
}
