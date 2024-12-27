part of 'favorite_movies_bloc.dart';

abstract class FavoriteMoviesState extends Equatable {
  const FavoriteMoviesState();

  @override
  List<Object> get props => [];
}

class FavoriteMoviesLoadingState extends FavoriteMoviesState {}

class FavoriteMoviesLoadedState extends FavoriteMoviesState {
  final List<MovieEntity> movies;

  const FavoriteMoviesLoadedState(this.movies);

  @override
  List<Object> get props => [movies];
}

class FavoriteMoviesErrorState extends FavoriteMoviesState {
  final String message;

  const FavoriteMoviesErrorState(this.message);

  @override
  List<Object> get props => [message];
}
