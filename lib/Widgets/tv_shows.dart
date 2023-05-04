import 'package:flutter/material.dart';

class TvShows extends StatefulWidget {
  final List topTvShows;
  const TvShows({super.key, required this.topTvShows});

  @override
  State<TvShows> createState() => _TvShowsState();
}

class _TvShowsState extends State<TvShows> {
  String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: double.infinity,
      padding: const EdgeInsets.all(4),
      child: ListView.builder(
        itemCount: widget.topTvShows.length,
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
                      'https://image.tmdb.org/t/p/w500${widget.topTvShows[index]['poster_path']}'),
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
                    text = widget.topTvShows[index]['name'] ?? 'Movie',
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
