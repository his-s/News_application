import 'package:news_api/constants/database_constants.dart';
import 'package:news_api/data/models/article_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDbHelper {
  LocalDbHelper._();
  static final LocalDbHelper instance = LocalDbHelper._();
  static Database? _db;

  Future<Database?> createDatabase() async {
    if (_db != null) return _db;
    String path = join(await getDatabasesPath(), 'articles.db');
    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) {
      db.execute(
          'create table $tableBookmarks($columnId integer primary key autoincrement,$columnTitle varchar(255),$columnDescription varchar(255),$columnArticalUrl varchar(255),$columnImageUrl varchar(255),publishedAt varchar(255))');
    });
    return _db;
  }

  Future<int> saveArticle(Article article) async {
    Database? db = await createDatabase();
    return await db!.insert(tableBookmarks, article.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List> getSavedArticles() async {
    Database? db = await createDatabase();
    return await db!.query(tableBookmarks);
  }

  Future<int> delete(int articleId) async {
    Database? db = await createDatabase();

    return await db!
        .delete(tableBookmarks, where: 'id = ?', whereArgs: [articleId]);
  }
}
