import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/features/daily_news/data/models/article_model.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/remote/remote_article_state.dart';
import 'package:flutter_news_app/features/daily_news/presentation/widgets/article_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(constraints),
      );
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    );
  }

  Widget _buildBody(BoxConstraints constraints) {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemoteArticleLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is RemoteArticleFailed) {
          return const Center(child: Icon(Icons.refresh));
        } else if (state is RemoteArticleSuccess) {
          state.articles!.map((e) => log(e.content ?? 'r'));
          return Scrollbar(
            // thumbVisibility: ,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 25.w),
              itemCount: state.articles?.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Article article = state.articles![index] as Article;
                return ArticleCard(
                  article: article,
                  constraints: constraints,
                );
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
