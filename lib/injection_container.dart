import 'package:dio/dio.dart';
import 'package:flutter_news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_news_app/features/daily_news/data/repository/article_repository.dart';
import 'package:flutter_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'core/resources/api_helper.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  /// we use singleton structure to register dependencies
  /// because we need to return the same instance of the object every time
  /// rather than creating a new one
  // Dio
  serviceLocator.registerSingleton<Dio>(Dio());
  // Register api helper class
  serviceLocator.registerSingleton<ApiHelper>(ApiHelper(serviceLocator()));
  // dependencies
  // news api service registration
  serviceLocator.registerSingleton<NewsApiService>(NewsApiService());
  // article repository registration
  serviceLocator.registerSingleton<ArticleRepository>(
      ArticleRepositoryImple(serviceLocator()));
  // Use cases
  // get article use case registration
  serviceLocator.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(serviceLocator()));

  // Blocs
  // we register it as a factory because we need a new instance every time when we call it
  // remote article bloc registration
  serviceLocator.registerFactory<RemoteArticleBloc>(
      () => RemoteArticleBloc(serviceLocator()));
}
