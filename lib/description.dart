import 'package:flutter/material.dart';
import 'package:v_star/Common%20widgets/text.dart';

class MovieDescription extends StatelessWidget {
  final String poster, title, rating, description, releaseDate;
  const MovieDescription(
      {super.key,
      required this.poster,
      required this.title,
      required this.rating,
      required this.description,
      required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 370,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        NetworkImage('https://image.tmdb.org/t/p/w500$poster'),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  releaseDate,
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  '⭐ $rating',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              'Overview',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          CommonText(text: description)
        ],
      ),
    );
  }
}
