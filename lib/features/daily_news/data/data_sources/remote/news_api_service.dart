import 'package:dio/dio.dart';
import 'package:flutter_news_app/core/api/api_config.dart';
import 'package:flutter_news_app/features/daily_news/data/models/article_model.dart';
import 'package:flutter_news_app/injection_container.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/resources/api_helper.dart';

class NewsApiService {
  Future<HttpResponse<List<Article>>> getNewsArticles(
      {required String apiKey,
      required String country,
      required String category}) async {
        
    Response response = await serviceLocator<ApiHelper>().getRequest(
      endPoint: ApiConfig.getNewsUrl,
      queryParameters: {
        "country": country,
        "category": category,
        "pageSize": 100,
      },
    );
    ArticleModel articleModel = ArticleModel.fromJson(response.data);
    HttpResponse<List<Article>> httpResponse =
        HttpResponse(articleModel.articles, response);
    return httpResponse;
  }
}


