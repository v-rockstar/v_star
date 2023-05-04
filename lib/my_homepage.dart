import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:v_star/Common%20widgets/text.dart';
import 'package:v_star/Widgets/top_rated_movies.dart';
import 'package:v_star/Widgets/trending_movies.dart';
import 'package:v_star/Widgets/tv_shows.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List topTvShows = [];
  final apiKey = '151ac3417b2838a619c1d6afcccdcff5';
  final apiToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNTFhYzM0MTdiMjgzOGE2MTljMWQ2YWZjY2NkY2ZmNSIsInN1YiI6IjY0Mzk0ODY0MWQ1Mzg2MDA5NzI1Yjc1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.q5dQnbAU0iH2mQ2ObbwgPgfz16zCArG4YBG8LsUvvDw';

  Future loadMovie() async {
    TMDB tmdb = TMDB(ApiKeys(apiKey, apiToken),
        logConfig: const ConfigLogger(showErrorLogs: true, showLogs: true));

    Map trendingMoviesResult = await tmdb.v3.trending.getTrending();
    Map topRatedMoviesResults = await tmdb.v3.movies.getTopRated();
    Map topTvShowsResults = await tmdb.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingMoviesResult['results'];
      topRatedMovies = topRatedMoviesResults['results'];
      topTvShows = topTvShowsResults['results'];
    });
  }

  @override
  void initState() {
    loadMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'V',
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 22, color: Colors.red),
            ),
            Text(
              'Star',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
            Text(
              ' P',
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 22, color: Colors.red),
            ),
            Text(
              'layer🎬',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CommonText(text: 'Trending Movies'),
            TrendingMovies(trending: trendingMovies),
            const CommonText(text: 'Top Rated Movies'),
            TopRatedMovies(topRated: topRatedMovies),
            const CommonText(text: 'Popular Tv Shows'),
            TvShows(topTvShows: topTvShows)
          ],
        ),
      ),
    );
  }
}
