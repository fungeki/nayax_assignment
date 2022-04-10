import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nayax_assignment/models/rest_client.dart';
import 'package:nayax_assignment/repositories/article_dao.dart';
import 'package:nayax_assignment/ui/articles_display_page.dart';

class App extends StatelessWidget {
  final dio = Dio(BaseOptions(contentType: 'application/json'));
  final ArticleDao articleDao;

  App(this.articleDao);

  @override
  Widget build(BuildContext context) {
    final restClient = RestClient(dio);
    return MaterialApp(
      theme: ThemeData(),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => restClient),
          RepositoryProvider(create: (context) => articleDao)
        ],
        child: ArticlesDisplayPage(
          restClient: restClient,
          articleDao: articleDao,
        ),
      ),
    );
  }
}
