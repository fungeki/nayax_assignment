import 'package:flutter/material.dart';
import 'package:nayax_assignment/blocs/article_bloc.dart';
import 'package:nayax_assignment/models/article.dart';
import 'package:nayax_assignment/ui/articles_custom_list_tile.dart';

class ArticlesDisplayListView extends StatefulWidget {
  const ArticlesDisplayListView(
      {Key? key, required this.articles, required this.state})
      : super(key: key);

  final List<Article> articles;
  final ArticleState state;
  @override
  State<ArticlesDisplayListView> createState() =>
      _ArticlesDisplayListViewState();
}

class _ArticlesDisplayListViewState extends State<ArticlesDisplayListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.articles.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ArticlesCustomListTile(
              article: widget.articles[index],
              state: widget.state,
            ),
            Divider(
              color: Colors.black,
            )
          ],
        );
      },
    );
  }
}
