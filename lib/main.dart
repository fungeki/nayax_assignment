import 'package:flutter/material.dart';
import 'package:nayax_assignment/repositories/article_database.dart';
import 'package:nayax_assignment/ui/app.dart';
import 'package:floor/floor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await $FloorArticleDatabase
      .databaseBuilder('flutter_database.db')
      .build();
  final dao = database.articleDao;
  runApp(App(dao));
}
