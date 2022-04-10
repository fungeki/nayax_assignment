import 'package:nayax_assignment/models/article.dart';

class ArticlesLibrary {
  List<Article> articles = [];

  ArticlesLibrary({required this.articles});

  factory ArticlesLibrary.fromJson(Map<String, dynamic> json) {
    final articlesList = json['articles'] as List;
    final articles = articlesList.map((e) => Article.fromJson(e)).toList();

    return ArticlesLibrary(articles: articles);
  }
}
