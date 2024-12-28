import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/app/features/favorites_movies/domain/entities/movie_entity.dart';
import 'package:movies_app/app/shared/error/api_exception.dart';
import 'package:movies_app/app/shared/utils/custom_shared_preferences/custom_shared_preferences.dart';
import 'package:movies_app/app/shared/utils/path_constant.dart';
import 'dart:convert';

class FavoritesMoviesDataSource {
  final Dio _dio;
  final SharedPreferencesService _preferences;

  FavoritesMoviesDataSource({required Dio dio, required SharedPreferencesService preferences})
      : _dio = dio,
        _preferences = preferences;

  Future<List<MovieEntity>> getFavoritesMovies() async {
    try {
      final response = await _dio.get(
        pathFavoriteMovies,
        queryParameters: {
          'language': 'es-CO',
          'page': 1,
          'sort_by': 'created_at.asc',
        },
      );

      final List<dynamic> results = response.data['results'];

      // Guardar datos en SharedPreferences usando SharedPreferencesService
      final encodedResults = results.map((json) => jsonEncode(json)).toList();
      await _preferences.setFavoriteMovies(encodedResults);

      return results.map((json) => MovieEntity.fromJson(json)).toList();
    } on DioException catch (e) {
      return _handleDioException(e);
    } catch (e) {
      debugPrint('Unexpected error: $e');
      throw ApiException('Unexpected error occurred');
    }
  }

  Future<List<MovieEntity>> _handleDioException(DioException e) async {
    if (e.response != null) {
      return _handleDioResponse(e.response!);
    } else if (e.error is SocketException) {
      debugPrint('No internet connection: ${e.error}');
      return _handleNoInternet();
    }
    throw ApiException('Unexpected error occurred');
  }

  Future<List<MovieEntity>> _handleDioResponse(Response<dynamic> response) async {
    if (response.statusCode == 400) {
      debugPrint('Bad Request (400): ${response.data}');
      throw ApiException('Bad Request - Invalid parameters');
    } else if (response.statusCode == 401) {
      debugPrint('Unauthorized (401): ${response.data}');
      throw ApiException('Unauthorized - Authentication required');
    } else {
      debugPrint('Error fetching favorite movies: ${response.statusCode} - ${response.data}');
      return _handleCache();
    }
  }

  Future<List<MovieEntity>> _handleNoInternet() async {
    final cachedData = await _preferences.getFavoriteMovies();

    if (cachedData.isNotEmpty) {
      try {
        return cachedData.map((json) => MovieEntity.fromJson(json)).toList();
      } catch (jsonError) {
        debugPrint('Error decoding cached JSON: $jsonError');
        throw ApiException('Failed to load favorite movies from cache');
      }
    }

    throw ApiException('No internet connection and no cached data available');
  }

  Future<List<MovieEntity>> _handleCache() async {
    final cachedData = await _preferences.getFavoriteMovies();

    if (cachedData.isNotEmpty) {
      try {
        return cachedData.map((json) => MovieEntity.fromJson(json)).toList();
      } catch (jsonError) {
        debugPrint('Error decoding cached JSON: $jsonError');
        throw ApiException('Failed to load favorite movies from cache');
      }
    }

    throw ApiException('Failed to load favorite movies');
  }
}
