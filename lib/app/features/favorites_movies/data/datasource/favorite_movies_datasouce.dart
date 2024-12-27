import 'package:dio/dio.dart';
import 'package:movies_app/app/features/favorites_movies/domain/entities/movie_entity.dart';
import 'package:movies_app/app/shared/error/api_exception.dart';

class FavoritesMoviesDataSource {
  final Dio _dio;

  FavoritesMoviesDataSource({required Dio dio}) : _dio = dio;

  Future<List<MovieEntity>> getFavoritesMovies() async {
    try {
      final response = await _dio.get(
        '/account/15300873/favorite/movies',
        queryParameters: {
          'language': 'es-CO',
          'page': 1,
          'sort_by': 'created_at.asc',
        },
      );

      final List<dynamic> results = response.data['results'];

      return results.map((json) => MovieEntity.fromJson(json)).toList();
    } on DioException catch (e) {
      print('Error fetching favorite movies: ${e.response?.statusCode} - ${e.response?.data}');
      throw ApiException('Failed to load favorite movies');
    } catch (e) {
      print('Unexpected error: $e');
      throw ApiException('Unexpected error occurred');
    }
  }
}
