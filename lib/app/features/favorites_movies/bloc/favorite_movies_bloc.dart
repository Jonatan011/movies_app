import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/app/features/favorites_movies/domain/entities/movie_entity.dart';
import 'package:movies_app/app/features/favorites_movies/domain/use_cases/get_favorites_movies_use_case.dart';

part 'favorite_movies_event.dart';
part 'favorite_movies_state.dart';

class FavoriteMoviesBloc extends Bloc<FavoriteMoviesEvent, FavoriteMoviesState> {
  final GetFavoritesMoviesUseCase getFavoriteMoviesUseCase;

  FavoriteMoviesBloc(this.getFavoriteMoviesUseCase) : super(FavoriteMoviesLoadingState()) {
    on<FavoriteMoviesFetchedEvent>((event, emit) async {
      emit(FavoriteMoviesLoadingState());
      final result = await getFavoriteMoviesUseCase();
      result.fold(
        (failure) => emit(FavoriteMoviesErrorState(failure.message)),
        (movies) => emit(FavoriteMoviesLoadedState(movies)),
      );
    });
  }
}
