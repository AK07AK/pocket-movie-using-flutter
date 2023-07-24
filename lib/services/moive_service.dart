import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pocket_movie/services/http_Service.dart';

import '../model/movie.dart';

class MovieService{
  final GetIt getIt = GetIt.instance;

  httpService? http;

  MovieService(){
    http = getIt.get<httpService>();
  }

  Future<List<Movie>> getPopularMovies({required int page}) async {
    Response? response = await http?.get('/movie/popular', query: {
      'page':page
    });
    if(response?.statusCode==200)
      {
        Map data = response?.data;
        List<Movie>  movies = data['results'].map<Movie>((movieData)
        {
          return Movie.fromJson(movieData);
        }).toList();
        return movies;
      }
    else{
      throw Exception('No Movies Found.');
    }
}


}

