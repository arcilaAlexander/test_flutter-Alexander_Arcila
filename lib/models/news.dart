import 'package:flutter_app1/utils/styles.dart';

class NewsApiModel {
  String status;
  int totalResults;
  List<News> articlesList;

  NewsApiModel(this.status, this.totalResults, this.articlesList);

  NewsApiModel.fromjson(Map<String, dynamic> map) {
    var mapArticles = map['articles'] as List;

    status = map['status'];
    totalResults = map['totalResults'];
    articlesList = mapArticles.map((json) => News.fromjson(json)).toList();
    /*
    articlesList =
        mapArticles.map((json) => News.fromjson(json)).cast<News>().toList();

     */
  }
}

class News {
  String image;
  String title;
  String author;
  String description;
  String url;
  String urlToImage;
  String content;
  String publishedAt;
  Source source;

  News(
      {this.image,
      this.title,
      this.author,
      this.description,
      this.url,
      this.urlToImage,
      this.content,
      this.publishedAt});

  News.fromjson(Map<String, dynamic> map) {
    source = Source.fromjson(map['source']);
    author = map['author'];
    title = map['title'];
    description = map['description'];
    content = map['content'];
    url = map['url'];
    urlToImage = map['urlToImage'];
    publishedAt = map['publishedAt'];
  }
}

class Source {
  String id;
  String name;

  Source(this.id, this.name);

  Source.fromjson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
