import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/app/features/favorites_movies/bloc/favorite_movies_bloc.dart';
import 'package:movies_app/app/features/favorites_movies/domain/entities/movie_entity.dart';
import 'package:movies_app/app/shared/app/ui/custom_app_bar_widget.dart';
import 'package:movies_app/app/shared/config/router/app_navigator.dart';
import 'package:movies_app/app/shared/design_system/color_palette.dart';
import 'package:movies_app/app/shared/design_system/styles.dart';
import 'package:movies_app/app/shared/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteMoviesBloc>().add(const FavoriteMoviesFetchedEvent());

    return Scaffold(
      appBar: CustomAppBarWidget(
        title: kTrFavoriteMovies.tr(),
        showBackButton: false,
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
      ),
      body: Container(
        color: greyShade900,
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
                  return _buildCardFavoriteMovies(context, movie);
                },
              );
            } else if (state is FavoriteMoviesErrorState) {
              return Center(child: Text(state.message, style: errorMessageStyle));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  InkWell _buildCardFavoriteMovies(BuildContext context, MovieEntity movie) {
    return InkWell(
      onTap: () {
        goToMovieDetails(context, movie);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        color: greyShade800,
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              movie.posterPath.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: '$kTrUrlBaseImage${movie.posterPath}',
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      width: 80.w,
                      height: 120.h,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox.shrink(),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: sectionTitleStyle,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      movie.overview,
                      style: subtitleTextStyle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
