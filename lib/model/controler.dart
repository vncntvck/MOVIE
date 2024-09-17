// import 'package:flutter/material.dart';
// import 'package:semogajaditugas/model/model.dart';

// class HomePage extends StatelessWidget {
//   // Dummy data for demonstration
//   final List<Movie> movies = [
//     Movie(title: 'Movie 1', backDropPath: 'path1', id: 1),
//     Movie(title: 'Movie 2', backDropPath: 'path2', id: 2),
//     // Add more movies here
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Movie List'),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: movies.length,
//         itemBuilder: (context, index) {
//           final movie = movies[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => MovieDetailPage(movie: movie),
//                 ),
//               );
//             },
//             child: Card(
//               child: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   Image.network(
//                     "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
//                     fit: BoxFit.cover,
//                   ),
//                   // You can add more details on the card here
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
