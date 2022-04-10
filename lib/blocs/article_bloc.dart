import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nayax_assignment/models/article.dart';
import 'package:nayax_assignment/models/rest_client.dart';
import 'package:nayax_assignment/repositories/article_database.dart';
import 'package:nayax_assignment/utils/constants.dart';

import '../repositories/article_dao.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final RestClient restClient;
  final ArticleDao articleDao;
  ArticleBloc(this.restClient, this.articleDao) : super(ArticleInitial()) {
    on<ArticleEvent>((event, emit) async {
      if (event is ClearArticlesEvent) {
        emit(ArticlesCleanState());
      }
      if (event is LoadApiEvent) {
        try {
          //check if connected to the internet, if not - display from memory
          final result = await InternetAddress.lookup('example.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            await emitJsonFromApiNews(emit);
          }
        } on SocketException catch (_) {
          final articlesFromDataBase = await articleDao.getAllArticles();
          emit(ArticleNoInternetState(articlesFromDataBase));
        }
      }
    });
  }

  Future<void> emitJsonFromApiNews(Emitter<ArticleState> emit) async {
    final List<Article> resultList = [];
    final entertainmentArticleList = await restClient.getEntertainmentIL();
    final scienceArtilceList = await restClient.getScienceIL();
    resultList.addAll(entertainmentArticleList.articles);
    resultList.addAll(scienceArtilceList.articles);
    await articleDao.insertArticles(resultList);
    emit(ArticleLoadedState(resultList));
  }

  @override
  Future<void> close() async {
    super.close();
  }
}
