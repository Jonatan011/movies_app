import 'package:dartz/dartz.dart';
import 'package:movies_app/app/features/favorites_movies/data/datasource/favorite_movies_datasouce.dart';
import 'package:movies_app/app/features/favorites_movies/domain/entities/movie_entity.dart';
import 'package:movies_app/app/features/favorites_movies/domain/repository/favorites_movies_repository.dart';
import 'package:movies_app/app/shared/error/failure.dart';

class FavoriteMoviesRepositoryImpl implements FavoritesMoviesRepository {
  final FavoritesMoviesDataSource datasource;

  FavoriteMoviesRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getFavoritesMovies() async {
    try {
      final cart = await datasource.getFavoritesMovies();
      return Right(cart);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
