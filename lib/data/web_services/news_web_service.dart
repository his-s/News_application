import 'package:dio/dio.dart';
import '../../constants/strings.dart';
import '../models/news_model.dart';

class NewsWebServices {
  final Dio dio = Dio();
  Future<dynamic> getNews(String category, String country) async {
    try {
      Response response = await dio.get(baseUrl, queryParameters: {
        "apiKey": "30408eb81dfd4b5fac4df6813af11ed2",
        "country": country,
        "category": category,
      });
      if (response.statusCode == 200) {
        News news = News.fromJson(response.data);
        return news.articles;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
