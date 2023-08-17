import 'package:dio/dio.dart';
import 'package:flutter_news_app/core/api/api_config.dart';
import 'package:flutter_news_app/features/daily_news/data/models/article_model.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: ApiConfig.baseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  // method to request news articles from server
  // set the retrofit parameters
  @GET(ApiConfig.getNewsUrl)
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query('apikey') String? apiKey,
    @Query('country') String? country,
    @Query('category') String? category,
  });
}
