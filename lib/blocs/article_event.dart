part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();
}

class LoadApiEvent extends ArticleEvent {
  @override
  List<Object?> get props => [];
}

class ClearArticlesEvent extends ArticleEvent {
  @override
  List<Object?> get props => [];
}
