part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();
}

class ArticleInitial extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticleLoadedState extends ArticleState {
  final List<Article> articles;

  const ArticleLoadedState(this.articles);

  @override
  List<Object?> get props => [articles];
}

class ArticlesCleanState extends ArticleState {
  final List<Article> articles = [];

  @override
  List<Object?> get props => [];
}

class ArticleNoInternetState extends ArticleState {
  final List<Article> articles;

  const ArticleNoInternetState(this.articles);

  @override
  List<Object?> get props => [articles];
}
