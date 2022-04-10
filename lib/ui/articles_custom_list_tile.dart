import 'package:flutter/material.dart';
import 'package:nayax_assignment/blocs/article_bloc.dart';
import 'package:nayax_assignment/models/article.dart';
import 'package:nayax_assignment/utils/constants.dart';

class ArticlesCustomListTile extends StatelessWidget {
  const ArticlesCustomListTile(
      {Key? key, required this.article, required this.state})
      : super(key: key);

  final Article article;
  final ArticleState state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildTextField(article.title ?? 'ללא כותרת'),
                buildTextField(article.author ?? 'מחבר לא ידוע'),
                buildTextField(article.description ?? 'ללא תיאור'),
              ],
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          (article.urlToImage != null && state is ArticleLoadedState)
              ? Image.network(
                  article.urlToImage!,
                  width: kImageSize,
                  height: kImageSize,
                  fit: BoxFit.cover,
                )
              : SizedBox(
                  height: kImageSize,
                  width: kImageSize,
                ),
        ],
      ),
    );
  }

  Text buildTextField(String text) => Text(
        text,
        maxLines: null,
        textAlign: TextAlign.end,
      );
}
