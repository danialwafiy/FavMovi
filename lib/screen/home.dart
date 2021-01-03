import 'package:favmovi/model/movie.dart';
import 'package:favmovi/repository/movie_repository.dart';
import 'package:favmovi/widget/movie_widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Movie> _movies = new List<Movie>(); 

  @override
  void initState() {
    super.initState(); 
    _populateAllMovies(); 
  }

  void _populateAllMovies() async {
    final _movieRepo = MovieRepository();
    final movies = await _movieRepo.fetchAllMovies();
    setState(() {
      _movies = movies; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(15),
        child:MovieWidget(movies: _movies,)
      )
    );
  }
}