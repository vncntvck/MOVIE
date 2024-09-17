class Movie {
  final int id; // ID film
  final String title; // Judul film
  final String? backDropPath; // Nullable jika tidak selalu ada
  final String? releaseDate; // Nullable jika tidak selalu ada
  final String? overview; // Nullable jika tidak selalu ada
  final double voteAverage; // Rating

  Movie({
    required this.id,
    required this.title,
    this.backDropPath,
    this.releaseDate,
    this.overview,
    required this.voteAverage,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      title: map['title'],
      backDropPath: map['backdrop_path'],
      releaseDate: map['release_date'],
      overview: map['overview'],
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'backdrop_path': backDropPath,
      'release_date': releaseDate,
      'overview': overview,
      'vote_average': voteAverage,
    };
  }
}