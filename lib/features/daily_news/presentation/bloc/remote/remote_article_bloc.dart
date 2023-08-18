// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:flutter_news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/remote/remote_article_event.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/artical.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }
                                
  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emitter) async {
    DataState<List<ArticleEntity>> dataState = await _getArticleUseCase.call();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      // emitter.call(
      //   RemoteArticleSuccess(dataState.data!),
      // );
      emit(
        RemoteArticleSuccess(dataState.data!),
      );
    } else if (dataState is DataFailed) {
      log('', error: dataState.error);
      emit(
        RemoteArticleFailed(dataState.error!),
      );
    }
  }
  
}
