
import 'dart:convert';

//packages
import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

//models
import '../model/app_config.dart';

//services
import 'package:pocket_movie/services/http_Service.dart';
import '../services/moive_service.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({required Key key,required this.onInitializationComplete}):super(key: key);


  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) =>
    _Setup(context).then((_) =>widget.onInitializationComplete()));
  }

  //this will setup the app config files by getting the data's from the API Provider
  Future<void> _Setup(BuildContext context) async{
    final getIt = GetIt.instance;

    final configfFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configfFile);

    //this getIt will make the appConfig as global using registerSingleton
    getIt.registerSingleton<AppConfig>(AppConfig(
        BASE_API_URL:configData['BASE_API_URL'],
        BASE_IMAGE_API_URL:configData['BASE_IMAGE_API_URL'],
        API_KEY:configData['API_KEY']),
    );

    getIt.registerSingleton<httpService>(httpService(),);
    getIt.registerSingleton<MovieService>(MovieService(),);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color:Colors.white,
      title: "Pocket Movie",
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.contain,image: AssetImage('assets/images/download.jpg'))
          ),
        ),
      ),
    );
  }
}
