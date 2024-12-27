import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/app/features/favorites_movies/bloc/favorite_movies_bloc.dart';
import 'package:movies_app/app/features/favorites_movies/data/datasource/favorite_movies_datasouce.dart';
import 'package:movies_app/app/features/favorites_movies/domain/use_cases/get_favorites_movies_use_case.dart';
import 'package:movies_app/app/features/favorites_movies/data/repository/favorites_movies_repository_impl.dart';

final getIt = GetIt.instance;

void init() {
  // Configuración de Dio

  getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwOGRlNjI3ZDFiYmEzOTRhY2Q0Y2VlYjkzY2NlN2U2NCIsIm5iZiI6MTY2NjU1MzUwMS4zLCJzdWIiOiI2MzU1OTY5ZDdhOTdhYjAwN2Q3NTI0YTUiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.HvCu26GKq3oy_CNL3iFdYWXM5fvtRJ5ZPp_RkgY67GA', // Reemplaza <TU_TOKEN>
          'Content-Type': 'application/json',
        },
      )));

  // DataSource
  getIt.registerLazySingleton<FavoritesMoviesDataSource>(() => FavoritesMoviesDataSource(dio: getIt()));

  // Repository
  getIt.registerLazySingleton<FavoriteMoviesRepositoryImpl>(() => FavoriteMoviesRepositoryImpl(getIt()));

  // UseCase
  getIt.registerLazySingleton<GetFavoritesMoviesUseCase>(() => GetFavoritesMoviesUseCase(getIt()));

  // Bloc
  getIt.registerFactory<FavoriteMoviesBloc>(() => FavoriteMoviesBloc(getIt()));
}
