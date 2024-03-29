import 'movie.dart';
import './search_category.dart';

class MainPageData {
  final List<Movie>? movies;
  final int page;
  final String searchCategory;
  final String searchText;

  MainPageData({this.movies, required this.page, required this.searchCategory, required this.searchText});

  MainPageData.inital()
      : movies = [],
        page = 1,
        searchCategory = SearchCategory.popular,
        searchText = '';

  MainPageData copyWith(
      {required List<Movie> movies,
        required int page,
        required String searchCategory,
        required String searchText}) {
    return MainPageData(
        movies: movies,
        page: page ,
        searchCategory: searchCategory,
        searchText: searchText);
  }
}