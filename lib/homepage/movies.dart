// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:semogajaditugas/model/movie_model_detail.dart';
// import 'movie.dart'; 


// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<Movie> movies = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchMovies();
//   }

//   Future<void> fetchMovies() async {
//     final apiKey = 'your_api_key_here';
//     final url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';

//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body)['results'] as List;
//         setState(() {
//           movies = data.map((json) => Movie.fromJson(json)).toList();
//         });
//       } else {
//         print('Failed to load movies');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Popular Movies'),
//       ),
//       body: movies.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: movies.length,
//               itemBuilder: (context, index) {
//                 final movie = movies[index];
//                 return ListTile(
//                   title: Text(movie.title),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => MovieDetailPage(movieId: movie.id),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }