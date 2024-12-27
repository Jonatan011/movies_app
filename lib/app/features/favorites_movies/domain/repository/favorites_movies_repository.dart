import 'package:dartz/dartz.dart';
import 'package:movies_app/app/features/favorites_movies/domain/entities/movie_entity.dart';
import 'package:movies_app/app/shared/error/failure.dart';

abstract class FavoritesMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getFavoritesMovies();
}
