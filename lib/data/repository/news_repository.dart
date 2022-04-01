import '../local_database/database_helper.dart';

import '../models/article_model.dart';
import '../web_services/news_web_service.dart';

class NewsRepository {
  final NewsWebServices newsWebServices;

  NewsRepository(this.newsWebServices);

  Future<List<Article>> getNews(String category, String country) async {
    late List<Article> news;
    try {
      news = await newsWebServices.getNews(category, country);
    } catch (e) {
      print(e.toString());
    }
    return news
        .where((element) =>
            element.title != null &&
            element.urlToImage != null &&
            element.description != null)
        .toList();
  }

  Future<List<Article>> getSavedNews() async {
    final LocalDbHelper localDbHelper = LocalDbHelper.instance;
    List news = await localDbHelper.getSavedArticles();
    List<Article> articles = news.map((e) => Article.fromJson(e)).toList();
    articles.forEach((element) {
      element.title!.compareTo(element.title ?? "");
    });

    return articles;
  }
}
