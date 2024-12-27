part of 'favorite_movies_bloc.dart';

abstract class FavoriteMoviesEvent extends Equatable {
  const FavoriteMoviesEvent();

  @override
  List<Object> get props => [];
}

class FavoriteMoviesFetchedEvent extends FavoriteMoviesEvent {
  const FavoriteMoviesFetchedEvent();
}
