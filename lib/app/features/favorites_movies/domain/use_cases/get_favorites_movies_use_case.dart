import 'package:dartz/dartz.dart';
import 'package:movies_app/app/features/favorites_movies/data/repository/favorites_movies_repository_impl.dart';
import 'package:movies_app/app/features/favorites_movies/domain/entities/movie_entity.dart';
import '../../../../shared/error/failure.dart';

class GetFavoritesMoviesUseCase {
  final FavoriteMoviesRepositoryImpl repository;

  GetFavoritesMoviesUseCase(this.repository);

  Future<Either<Failure, List<MovieEntity>>> call() {
    return repository.getFavoritesMovies();
  }
}
