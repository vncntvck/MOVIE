// class Movie {
//   final int id;
//   final String title;
//   final String backdropPath;

//   Movie({
//     required this.id,
//     required this.title,
//     required this.backdropPath,
//   });

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       id: json['id'],
//       title: json['title'],
//       backdropPath: json['backdrop_path'] ?? '',
//     );
//   }
// }