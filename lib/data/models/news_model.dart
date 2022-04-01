import 'article_model.dart';

class News {
  String? status;
  int? totalResults;
  List<Article>? articles;

  News({this.status, this.totalResults, this.articles});

  News.fromJson(Map<String, dynamic> json) {
    this.status = json["status"];
    this.totalResults = json["totalResults"];
    this.articles = json["articles"] == null
        ? null
        : (json["articles"] as List).map((e) => Article.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["totalResults"] = this.totalResults;
    if (this.articles != null)
      data["articles"] = this.articles?.map((e) => e.toJson()).toList();
    return data;
  }
}
