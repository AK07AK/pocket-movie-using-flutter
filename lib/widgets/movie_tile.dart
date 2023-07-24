//packages
import'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

//models
import '../model/movie.dart';
class MovieTile extends StatelessWidget {

  final GetIt getIt = GetIt.instance;
  final double height;
  final double width;
  final Movie movie;
  MovieTile({super.key,required this.height,required this.width,required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _moviePosterWidget(movie.posterUrl()),
          _movieInfoWidget(),
        ],
      ),
    );
  }
  Widget _movieInfoWidget()
  {
    return SizedBox(
      height: height,
      width: width*0.66,
      child:  Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                movie.name,
            overflow:TextOverflow.ellipsis,
            style:const TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w400) ,
            ),
              Text(movie.rating.toString(),style: const TextStyle(color:Colors.white,fontSize: 22),),
            ],
          ),
          Container(
            padding:EdgeInsets.fromLTRB(0, height*0.02, 0, 0),
            child: Text(
              '${movie.lang.toUpperCase()} | R: ${movie.isAdult} | ${movie.releaseDate}',
              style: const TextStyle(color:Colors.white,fontSize: 10,),

            ),
          ),
          Container(
            padding:EdgeInsets.fromLTRB(0, height*0.07, 0, 0),
            child: Text(movie.description,maxLines: 9,overflow: TextOverflow.ellipsis,style: const TextStyle(color:Colors.white70,fontWeight: FontWeight.w400,fontSize: 15),),
          )
        ],

      ),
    );
  }
  Widget _moviePosterWidget(String posterURL)
  {
    return Container(
      height: height,
      width: width*0.35,
      decoration: const BoxDecoration(
        image: DecorationImage(image: NetworkImage('https://i.pinimg.com/564x/9e/f1/e9/9ef1e9d622ba4225c4ee193c2c17e665.jpg'))
      ),
    );
  }
}
