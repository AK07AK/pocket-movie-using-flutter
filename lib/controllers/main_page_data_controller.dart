import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:pocket_movie/pages/main_page.dart';
import 'package:pocket_movie/services/moive_service.dart';

//models

import '../model/main_page_data.dart';
import '../model/movie.dart';

class MainPageDataController extends StateNotifier{
  
  MainPageDataController([MainPageData? state]) : super(state)
  {
    getMovies();
}
final MovieService _movieService = GetIt. instance.get<MovieService>();

  Future<void> getMovies() async{
    try{
      List<Movie>  movies = [];
      movies = await _movieService.getPopularMovies(page: state.page);
    }
    catch(e){
      print(e);
    }
  }

 }