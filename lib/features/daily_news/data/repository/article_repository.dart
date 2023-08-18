import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_news_app/core/api/api_config.dart';
import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_news_app/features/daily_news/data/models/article_model.dart';
import 'package:flutter_news_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImple implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImple(this._newsApiService);
  @override
  Future<DataState<List<Article>>> getNewsArticles() async {
    
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: ApiConfig.apiKey,
        category: ApiConfig.categoryQuery,
        country: ApiConfig.countryQuery,
      );
      log(httpResponse.response.statusCode.toString());
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            error: httpResponse.response.statusMessage,
          ),
        );
      }
    } on DioException catch (e) {
      log('', error: e.error);
      return DataFailed(e);
    }
  }
}
