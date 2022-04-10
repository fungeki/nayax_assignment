import 'package:floor/floor.dart';
import 'package:nayax_assignment/models/article.dart';

@dao
abstract class ArticleDao {
  @Query('SELECT * FROM Article')
  Future<List<Article>> getAllArticles();

  @Insert()
  Future<void> insertArticles(List<Article> articles);
}
