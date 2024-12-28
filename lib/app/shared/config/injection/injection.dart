import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/app/features/favorites_movies/bloc/favorite_movies_bloc.dart';
import 'package:movies_app/app/features/favorites_movies/data/datasource/favorite_movies_datasouce.dart';
import 'package:movies_app/app/features/favorites_movies/domain/use_cases/get_favorites_movies_use_case.dart';
import 'package:movies_app/app/features/favorites_movies/data/repository/favorites_movies_repository_impl.dart';
import 'package:movies_app/app/shared/utils/custom_shared_preferences/custom_shared_preferences.dart';
import 'package:movies_app/app/shared/utils/path_constant.dart';

final getIt = GetIt.instance;

void init() {
  // Registro en getIt
  getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      )));
  getIt.registerLazySingleton<SharedPreferencesService>(() => SharedPreferencesService());
  getIt.registerLazySingleton<FavoritesMoviesDataSource>(() => FavoritesMoviesDataSource(
        dio: getIt(),
        preferences: getIt(),
      ));

  // Repository
  getIt.registerLazySingleton<FavoriteMoviesRepositoryImpl>(() => FavoriteMoviesRepositoryImpl(getIt()));

  // UseCase
  getIt.registerLazySingleton<GetFavoritesMoviesUseCase>(() => GetFavoritesMoviesUseCase(getIt()));

  // Bloc
  getIt.registerFactory<FavoriteMoviesBloc>(() => FavoriteMoviesBloc(getIt()));
}
