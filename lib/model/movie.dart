class Movie {
  
  final int id; 
  final String poster_path; 
  final String title; 
  final String overview; 

  Movie({this.id, this.title, this.poster_path, this.overview}); 

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"], 
      poster_path: json["poster_path"], 
      title: json["title"], 
      overview: json["overview"]
    );
  }

}