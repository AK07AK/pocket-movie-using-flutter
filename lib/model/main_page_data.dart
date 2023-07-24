import 'movie.dart';
import './search_category.dart';
class MainPageData{
   final List<Movie> movies;
  final int currentPage;
  final String searchCategory;
  final String searchText;
  MainPageData({
    required this.movies,
    required this.currentPage,
    required this.searchCategory,
    required this.searchText,

});
  MainPageData.initial() : movies = [] ,currentPage = 1,searchCategory = SearchCategory.popular,searchText = '';
  MainPageData copyWith(List<Movie> movies,int currentPage,String searchCategory,String searchText)
  {
    return MainPageData(
        movies: movies ?? this.movies,
        currentPage: currentPage ?? this.currentPage ,
        searchCategory: searchCategory ?? this.searchCategory,
        searchText: searchText ?? this.searchText
    );
  }


}