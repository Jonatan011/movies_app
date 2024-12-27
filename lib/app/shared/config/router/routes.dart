import 'package:go_router/go_router.dart';
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
    GoRoute(path: kRouteHome, builder: (context, state) => const HomeScreen()),
  ],
);
