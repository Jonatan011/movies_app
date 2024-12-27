class MovieEntity {
  final String title;
  final String posterPath;
  final String overview;

  MovieEntity({
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      title: json['title'] as String? ?? 'Título desconocido',
      posterPath: json['poster_path'] as String? ?? '',
      overview: json['overview'] as String? ?? 'Sin descripción disponible',
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'poster_path': posterPath,
        'overview': overview,
      };
}
