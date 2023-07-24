
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../model/app_config.dart';
class httpService {
  final Dio dio = Dio();
  final getIt = GetIt.instance;

  String? base_url;
  String? api_key;

  httpService(){
    AppConfig config = getIt.get<AppConfig>();
    base_url = config.BASE_API_URL;
    api_key = config.API_KEY;
}

Future<Response> get(String path,{required Map<String,dynamic> query}) async{
      String url = '$base_url$path';
      Map<String,dynamic> _query = {
        'api_key': api_key,
        'language': 'en-US',
      };
      if(query!=null)
      {
          _query.addAll(query);
      }
      return await dio.get(url,queryParameters: _query);
  }
}