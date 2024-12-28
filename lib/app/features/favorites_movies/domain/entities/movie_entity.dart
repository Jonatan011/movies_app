class MovieEntity {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final double popularity;
  final double voteAverage;

  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.popularity,
    required this.voteAverage,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
    );
  }
}
