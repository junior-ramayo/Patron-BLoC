import 'dart:convert';

class Resp {
    Resp({
      required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory Resp.fromJson(String str) => Resp.fromMap(json.decode(str));


    factory Resp.fromMap(Map<String, dynamic> json) => Resp(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

}

class Movie {
    Movie({
     required   this.adult,
     this.backdropPath,
      required  this.genreIds,
      required  this.id,
      required  this.originalLanguage,
      required  this.originalTitle,
      required  this.overview,
      required  this.popularity,
      this.posterPath,
      this.releaseDate,
      required  this.title,
      required  this.video,
      required  this.voteAverage,
      required  this.voteCount,
    });

    bool adult;
    String? backdropPath;
    List<int> genreIds;
    int id;
    String originalLanguage;
    String originalTitle;
    String overview;
    double popularity;
    String? posterPath;
    DateTime? releaseDate;
    String title;
    bool video;
    double voteAverage;
    int voteCount;

    factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

    factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

   
}

