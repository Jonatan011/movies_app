import 'package:go_router/go_router.dart';
import 'package:movies_app/app/features/details_movies/ui/screens/detail_movies_screen.dart';
import 'package:movies_app/app/features/favorites_movies/domain/entities/movie_entity.dart';
import 'package:movies_app/app/features/home/ui/home_screen.dart';
import 'package:movies_app/app/features/splash/ui/splash_screen.dart';
import 'package:movies_app/app/shared/config/router/route_names.dart';

final GoRouter router = GoRouter(
  initialLocation: kRouteSplash,
  routes: [
    // Splash Screen
    GoRoute(
      path: kRouteSplash,
      builder: (context, state) => const SplashScreen(),
    ),
    // Home Screen
    GoRoute(
      path: kRouteHome,
      builder: (context, state) => const HomeScreen(),
    ),
    // Details Screen
    GoRoute(
      path: kRouteDetails,
      builder: (context, state) {
        final movie = state.extra as MovieEntity;
        return MovieDetailScreen(movie: movie);
      },
    ),
  ],
);
