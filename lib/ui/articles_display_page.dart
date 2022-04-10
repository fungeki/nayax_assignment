import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nayax_assignment/blocs/article_bloc.dart';
import 'package:nayax_assignment/models/article.dart';
import 'package:nayax_assignment/models/rest_client.dart';
import 'package:nayax_assignment/repositories/article_dao.dart';
import 'package:nayax_assignment/ui/articles_display_action_button.dart';
import 'package:nayax_assignment/ui/articles_display_list_view.dart';

class ArticlesDisplayPage extends StatefulWidget {
  ArticlesDisplayPage(
      {Key? key, required this.restClient, required this.articleDao})
      : super(key: key);

  final ArticleDao articleDao;
  final RestClient restClient;
  @override
  State<ArticlesDisplayPage> createState() => _ArticlesDisplayPageState();
}

class _ArticlesDisplayPageState extends State<ArticlesDisplayPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ArticleBloc(
          RepositoryProvider.of(context), RepositoryProvider.of(context))
        ..add(LoadApiEvent()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ArticleBloc, ArticleState>(
            builder: (BuildContext context, state) {
              List<Article> articles = [];
              if (state is ArticleLoadedState) {
                articles = state.articles;
              }

              if (state is ArticleNoInternetState) {
                articles = state.articles;
              }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ArticlesDisplayActionButton(
                              context: context,
                              event: ClearArticlesEvent(),
                              text: 'Clear'),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: ArticlesDisplayActionButton(
                              context: context,
                              event: LoadApiEvent(),
                              text: 'Refresh'),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: state is ArticleInitial
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ArticlesDisplayListView(
                                  articles: articles, state: state),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
