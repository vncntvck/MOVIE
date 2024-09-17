// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class APIService {
//   final String apiKey = '924520610ca89c58357e065d60e4857b'; // Your TMDb API key

//   Future<String?> getTrailerUrl(int movieId) async {
//     final url =
//         'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey&language=en-US';

//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final results = data['results'] as List;
//         if (results.isNotEmpty) {
//           // Get the first trailer from the list
//           final trailer = results.firstWhere(
//               (video) => video['type'] == 'Trailer',
//               orElse: () => null);
//           return trailer?['key'] != null
//               ? 'https://www.youtube.com/watch?v=${trailer['key']}'
//               : null;
//         }
//       }
//     } catch (e) {
//       print('Error fetching trailer URL: $e');
//     }
//     return null;
//   }
// }