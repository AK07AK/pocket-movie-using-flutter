import 'dart:ui';

//packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_movie/controllers/main_page_data_controller.dart';
import 'package:pocket_movie/model/main_page_data.dart';


//models
import '../model/movie.dart';
//widgets
import '../widgets/topbar.dart';
import '../widgets/movie_tile.dart';


final mainPageDataControllerProvider =
StateNotifierProvider<MainPageDataController>((ref) {
  return MainPageDataController();
});

class MainPage extends ConsumerWidget{
  late double devicesHeight;
  late double devicesWidth;

  late MainPageDataController mainPageDataController;
  late MainPageData mainPageData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    devicesHeight = MediaQuery.of(context).size.height;
    devicesWidth = MediaQuery.of(context).size.width;
    mainPageDataController = ref.watch(mainPageDataControllerProvider);
    return _buildUI();
  }
  Widget _buildUI(){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SizedBox(
        height:devicesHeight ,
        width:devicesWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            background(),
            foregroundWidget(),
          ],
        ),
      ),
    );
  }
  Widget background(){
    return Container(
      height: devicesHeight,
      width: devicesWidth,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
      image: const DecorationImage(image: NetworkImage('https://i.pinimg.com/236x/27/1d/97/271d9775390e2256c59e80fadbfca7b0.jpg'),
          fit:BoxFit.cover,
    )
      ),
      child: BackdropFilter(
        filter:ImageFilter.blur(sigmaX:15.0,sigmaY:15.0),
        child: Container(
          decoration: BoxDecoration(color:Colors.black.withOpacity(0.2))
        ),
      ),
    );
  }
  Widget foregroundWidget(){
    return Container(
        padding: EdgeInsets.fromLTRB(0, devicesHeight*0.01, 0, 0),
      width: devicesWidth*0.88,
      child:Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topBar(),
          Container(
            height: devicesHeight*0.80,
            padding: EdgeInsets.symmetric(vertical: devicesHeight*0.01),
            child: moviesListViewWidget(),
          )
        ],
      ),
    );
  }
  Widget moviesListViewWidget(){
    final List<Movie> _movies = [];
    for(var i =0;i<20;i++)
      {
        _movies.add(Movie(
          name: 'The dark Knight',
          lang: 'EN',
          isAdult: false,
          description: "The plot follows the vigilante Batman, police lieutenant James Gordon, and district attorney Harvey Dent, who form an alliance to dismantle organized crime in Gotham City",
          posterPath:'https://i.pinimg.com/564x/9e/f1/e9/9ef1e9d622ba4225c4ee193c2c17e665.jpg' ,
          backdropPath: 'https://i.pinimg.com/564x/9e/f1/e9/9ef1e9d622ba4225c4ee193c2c17e665.jpg',
          rating: 8.2,
          releaseDate: "18 July 2008"
        ));
      }
    if(_movies.isNotEmpty)
    {
        return ListView.builder(
          itemCount: _movies.length,
          itemBuilder:(BuildContext context,int index)
          {
            return Padding(padding: EdgeInsets.symmetric(vertical: devicesHeight*0.01,horizontal: 0),
            child: GestureDetector(
              onTap: (){},
              child: MovieTile(
                movie:_movies[index],
                height:devicesHeight*0.20,
                width: devicesWidth*0.85,),

            ) ,
            );
          },
        );
    }
    else{
      return const Center(
        child: CircularProgressIndicator(backgroundColor: Colors.white,),
      );
    }
  }


}