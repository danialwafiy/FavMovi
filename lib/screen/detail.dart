import 'package:cached_network_image/cached_network_image.dart';
import 'package:favmovi/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:favmovi/style/theme.dart' as Style;

class DetailScreen extends StatefulWidget {

  final Movie movie;
  DetailScreen(this.movie);

  @override
  _DetailScreenState createState() => _DetailScreenState(movie);
}

class _DetailScreenState extends State<DetailScreen> {

  final Movie movie;
_DetailScreenState(this.movie);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: Column(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/3,
                  child: CachedNetworkImage(
                      imageUrl:
                          'http://image.tmdb.org/t/p/original/${movie.poster_path}',
                      fit: BoxFit.cover,
                    )
                ),
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,textAlign: TextAlign.start, style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Text(movie.overview,textAlign: TextAlign.start, style: TextStyle(color: Colors.white,fontSize: 12,height: 1.5))
                ],
              ),
            )
          ],
        ),
    );
  }
}