import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/config/theme/app_theme.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/remote/remote_article_event.dart';
import 'package:flutter_news_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => serviceLocator()..add(const GetArticles()),
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, Widget? child) {
            return MaterialApp(
              theme: AppTheme.theme,
              debugShowCheckedModeBanner: kDebugMode,
              home: const DailyNews(),
            );
          }
      ),
    );
  }
}
