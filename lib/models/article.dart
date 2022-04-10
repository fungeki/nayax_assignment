import 'package:floor/floor.dart';

@entity
class Article {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String? author;
  final String? title;
  final String? description;
  final String? urlToImage;

  Article(
      {this.urlToImage, this.author, this.title, this.description, this.id});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        urlToImage: json['urlToImage']);
  }
}
