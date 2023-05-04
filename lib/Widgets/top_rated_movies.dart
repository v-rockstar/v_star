import 'package:flutter/material.dart';

class TopRatedMovies extends StatefulWidget {
  final List topRated;
  const TopRatedMovies({super.key, required this.topRated});

  @override
  State<TopRatedMovies> createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: double.infinity,
      padding: const EdgeInsets.all(4),
      child: ListView.builder(
        itemCount: widget.topRated.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 290,
                width: 200,
                padding: const EdgeInsets.all(7),
                child: Image(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${widget.topRated[index]['poster_path']}'),
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
                    text = widget.topRated[index]['title'] ?? 'Movie',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ))
            ],
          );
        },
      ),
    );
  }
}
