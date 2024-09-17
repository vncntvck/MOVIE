import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:semogajaditugas/model/model.dart';

const apiKey = "924520610ca89c58357e065d60e4857b";

class APIService {
  final nowShowingApi = "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey";
  final upComingApi = "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
  final topTvtierApi = "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey";

  // for nowShowing API movie
  Future<List<Movie>> getNowShowing() async {
    Uri url = Uri.parse(nowShowingApi);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to get now showing movies");
    }
  }

  // for upcoming API movie (popular movies)
  Future<List<Movie>> getUpcoming() async {
    Uri url = Uri.parse(upComingApi);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to get upcoming movies");
    }
  }

   // for upcoming API movie (popular movies)
  Future<List<Movie>> getTopTv() async {
    Uri url = Uri.parse(topTvtierApi);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to get upcoming movies");
    }
  }

  // for fetching movie details including the rating
  Future<Movie> getMovieDetails(int movieId) async {
    final String detailsApi = "https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey";
    Uri url = Uri.parse(detailsApi);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Movie.fromMap(data);
    } else {
      throw Exception("Failed to get movie details");
    }
  }
}