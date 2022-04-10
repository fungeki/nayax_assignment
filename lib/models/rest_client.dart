import 'package:nayax_assignment/models/articles_library.dart';
import 'package:nayax_assignment/utils/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: kBaseUrlApiNews)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(kAPIcallForEntertainmentInIsrael)
  Future<ArticlesLibrary> getEntertainmentIL();

  @GET(kAPIcallForScienceInIsrael)
  Future<ArticlesLibrary> getScienceIL();
}
