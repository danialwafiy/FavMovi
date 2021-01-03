import 'package:cached_network_image/cached_network_image.dart';
import 'package:favmovi/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:favmovi/screen/detail.dart';


class MovieWidget extends StatelessWidget {
  final List<Movie> movies;

  MovieWidget({this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return GridTile(
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(movie) ),);
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(3.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          'http://image.tmdb.org/t/p/original/${movie.poster_path}',
                      fit: BoxFit.fill,
                    ))),
            footer: Center(
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.favorite),
                onPressed: () {
                  test2();
                },
              ),
            ),
          );
        });
  }

  void test2() {
    print(2);
  }
}
