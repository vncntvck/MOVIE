import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:semogajaditugas/model/movie_model_detail.dart';
import '../model/model.dart';
import '../service/service.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Movie>> nowShowing;
  late Future<List<Movie>> upComing;
  late Future<List<Movie>> topTvtier;
  bool isLoading = true;
  int _currentIndex = 0;
  static const int maxDots = 5;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    nowShowing = APIService().getNowShowing();
    upComing = APIService().getUpcoming();
    topTvtier = APIService().getTopTv();

    await Future.wait([nowShowing, upComing, topTvtier]);

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _refreshPage() async {
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshPage,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              if (isLoading)
                buildShimmerPlaceholder()
              else
                buildMovieCarousel(),
              SizedBox(height: 20.0),
              buildSectionTitle('TOP TIER MOVIE'),
              buildMovieList(upComing),
              SizedBox(height: 20.0),
              buildSectionTitle('NEW MOVIE'),
              buildMovieList(topTvtier),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: Duration(seconds: 10),
      child: Container(
        height: 200,
        color: Colors.white,
      ),
    );
  }

  Widget buildMovieCarousel() {
    return FutureBuilder<List<Movie>>(
      future: nowShowing,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final movies = snapshot.data!;
        final int dotCount = movies.length > maxDots ? maxDots : movies.length;
        final int currentDotIndex = _currentIndex % dotCount;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              itemCount: movies.length,
              itemBuilder: (context, index, realIndex) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailPage(movieId: movie.id),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/original/${movie.backDropPath}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 0,
                        right: 0,
                        child: Text(
                          movie.title,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 1.7,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(dotCount, (index) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == currentDotIndex
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget buildMovieList(Future<List<Movie>> movieList) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 250,
      child: FutureBuilder<List<Movie>>(
        future: movieList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final movies = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailPage(movieId: movie.id),
                    ),
                  );
                },
                child: Container(
                  width: 180,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}