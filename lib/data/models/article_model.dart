import 'source_model.dart';

class Article {
  Source? source;
  dynamic author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  int? id;

  Article(
      {this.id,
      this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Article.fromJson(Map<String, dynamic> json) {
    this.source =
        json["source"] == null ? null : Source.fromJson(json["source"]);
    this.author = json["author"];
    this.title = json["title"];
    this.description = json["description"];
    this.url = json["url"];
    this.urlToImage = json["urlToImage"];
    this.publishedAt = json["publishedAt"];
    this.content = json["content"];
    this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = this.title;
    data["description"] = this.description;
    data["url"] = this.url;
    data["urlToImage"] = this.urlToImage;
    return data;
  }
}
