import 'package:flutter/material.dart';
import 'package:v_star/description.dart';

class TrendingMovies extends StatefulWidget {
  final List trending;
  const TrendingMovies({super.key, required this.trending});

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: double.infinity,
      padding: const EdgeInsets.all(4),
      child: ListView.builder(
        itemCount: widget.trending.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDescription(
                      poster: widget.trending[index]['poster_path'],
                      title: text = widget.trending[index]['title'] ?? 'Movie',
                      rating: widget.trending[index]['vote_average'].toString(),
                      description: widget.trending[index]['overview'],
                      releaseDate:
                          widget.trending[index]['release_date'].toString(),
                    ),
                  ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 290,
                  width: 200,
                  padding: const EdgeInsets.all(7),
                  child: Image(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500${widget.trending[index]['poster_path']}'),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                    width: 180,
                    height: 50,
                    child: Text(
                      text = widget.trending[index]['title'] ?? 'Movie',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
