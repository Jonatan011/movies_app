import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/app/features/favorites_movies/bloc/favorite_movies_bloc.dart';
import 'package:movies_app/app/shared/design_system/color_palette.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteMoviesBloc>().add(const FavoriteMoviesFetchedEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Películas Favoritas',
          style: TextStyle(color: white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: white,
            ),
            onPressed: () {
              context.read<FavoriteMoviesBloc>().add(const FavoriteMoviesFetchedEvent());
            },
          ),
        ],
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent.shade200, Colors.deepPurple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[900], // Fondo más suave oscuro
        child: BlocBuilder<FavoriteMoviesBloc, FavoriteMoviesState>(
          builder: (context, state) {
            if (state is FavoriteMoviesLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoriteMoviesLoadedState) {
              final movies = state.movies;
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Colors.grey[850], // Fondo de la tarjeta más suave
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          movie.posterPath.isNotEmpty
                              ? Image.network(
                                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                  width: 80,
                                  height: 120,
                                  fit: BoxFit.cover,
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  movie.overview,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is FavoriteMoviesErrorState) {
              return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
