// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorArticleDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ArticleDatabaseBuilder databaseBuilder(String name) =>
      _$ArticleDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ArticleDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$ArticleDatabaseBuilder(null);
}

class _$ArticleDatabaseBuilder {
  _$ArticleDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ArticleDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ArticleDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ArticleDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ArticleDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ArticleDatabase extends ArticleDatabase {
  _$ArticleDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ArticleDao? _articleDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Article` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `author` TEXT, `title` TEXT, `description` TEXT, `urlToImage` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ArticleDao get articleDao {
    return _articleDaoInstance ??= _$ArticleDao(database, changeListener);
  }
}

class _$ArticleDao extends ArticleDao {
  _$ArticleDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _articleInsertionAdapter = InsertionAdapter(
            database,
            'Article',
            (Article item) => <String, Object?>{
                  'id': item.id,
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'urlToImage': item.urlToImage
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Article> _articleInsertionAdapter;

  @override
  Future<List<Article>> getAllArticles() async {
    return _queryAdapter.queryList('SELECT * FROM Article',
        mapper: (Map<String, Object?> row) => Article(
            urlToImage: row['urlToImage'] as String?,
            author: row['author'] as String?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            id: row['id'] as int?));
  }

  @override
  Future<void> insertArticles(List<Article> articles) async {
    await _articleInsertionAdapter.insertList(
        articles, OnConflictStrategy.abort);
  }
}
