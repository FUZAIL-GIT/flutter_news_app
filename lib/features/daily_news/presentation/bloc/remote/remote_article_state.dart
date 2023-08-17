import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/features/daily_news/domain/entities/artical.dart';

// the base abstract class for all classes
abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;
  const RemoteArticleState({this.articles, this.error});
  @override
  List<Object> get props => [articles!, error!];
}

// to wait for the response
class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

// success case when we get the data
class RemoteArticleSuccess extends RemoteArticleState {
  const RemoteArticleSuccess(List<ArticleEntity> articles)
      : super(articles: articles);
}

// failure case when we get an exception
class RemoteArticleFailed extends RemoteArticleState {
  const RemoteArticleFailed(DioException error) : super(error: error);
}
