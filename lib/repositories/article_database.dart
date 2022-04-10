import 'dart:async';
import 'package:floor/floor.dart';
import 'package:nayax_assignment/models/article.dart';
import 'package:nayax_assignment/repositories/article_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'article_database.g.dart';

@Database(version: 1, entities: [Article])
abstract class ArticleDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
