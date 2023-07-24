import 'package:get_it/get_it.dart';
import 'package:pocket_movie/model/app_config.dart';

class Movie{
  final String name;
  final String lang;
  final bool isAdult;
  final String description;
  final String posterPath;
  final String backdropPath;
  final num rating;
  final String releaseDate;

  Movie({
    required this.name,
    required this.lang,
    required this.isAdult,
    required this.description,
    required this.posterPath,
    required this.backdropPath,
    required this.rating,
    required this.releaseDate
});

  factory Movie.fromJson(Map<String,dynamic> _json)
  {
    return Movie(
      name:_json['title'],
      lang: _json['original_lang'],
      isAdult: _json['adult'],
      description: _json['overview'],
      posterPath: _json['poster_path'],
      backdropPath: _json['backdrop_path'],
      rating: _json['vote_average'],
      releaseDate: _json['release_date'],
    );
  }
  String posterUrl()
  {
    final AppConfig appConfig = GetIt.instance.get<AppConfig>();
    return '$appConfig.BASE_IMAGE_API_URL)$posterPath';
  }
}