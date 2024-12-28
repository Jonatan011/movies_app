import 'package:flutter_dotenv/flutter_dotenv.dart';

// Base URL desde .env o valor predeterminado
const String baseUrlDefault = 'https://api.themoviedb.org/3';
final String baseUrl = dotenv.env['BASE_URL'] ?? baseUrlDefault;

// Token desde .env o valor predeterminado
const String tokenDefault =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwOGRlNjI3ZDFiYmEzOTRhY2Q0Y2VlYjkzY2NlN2U2NCIsIm5iZiI6MTY2NjU1MzUwMS4zLCJzdWIiOiI2MzU1OTY5ZDdhOTdhYjAwN2Q3NTI0YTUiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.HvCu26GKq3oy_CNL3iFdYWXM5fvtRJ5ZPp_RkgY67GA';
final String token = dotenv.env['API_TOKEN'] ?? tokenDefault;

// User ID desde .env o valor predeterminado
const String userIdDefault = '15300873';
final String userId = dotenv.env['USER_ID'] ?? userIdDefault;

// Paths de la API
final String pathFavoriteMovies = '/account/$userId/favorite/movies';
