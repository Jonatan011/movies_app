import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/app/features/favorites_movies/domain/entities/movie_entity.dart';
import 'package:movies_app/app/shared/config/router/route_names.dart';

goToHome(BuildContext context) => context.go(kRouteHome);
void goToMovieDetails(BuildContext context, MovieEntity movie) {
  context.push(kRouteDetails, extra: movie);
}
