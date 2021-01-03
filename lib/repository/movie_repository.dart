import 'package:dio/dio.dart';
import 'package:favmovi/model/movie.dart';

class MovieRepository{

  Future<List<Movie>> fetchAllMovies() async {
    var dio = Dio();
    final response = await dio.get("https://api.themoviedb.org/3/movie/popular?api_key=dd71e46862a37f62d30b2299876be003&language=en-US&page=1");
    if(response.statusCode == 200) {
      final result = response.data;
      return (result['results'] as List).map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }

  }

}