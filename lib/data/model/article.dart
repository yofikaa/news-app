import 'dart:convert';

class ArticlesResult {
  String status;
  int totalResults;
  List<Article> articles;

  ArticlesResult({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticlesResult.fromJson(Map<String, dynamic> json) => ArticlesResult(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from((json["articles"] as List)
        .map((x) => Article.fromJson(x))
        .where((article) =>
          article.author != null &&
          article.urlToImage != null &&
          article.publishedAt != null &&
          article.content != null)),
  );

}

class Article {
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Article.fromJson(Map<String, dynamic> article) {
    author = article['author'];
    title = article['title'];
    description = article['description'];
    url = article['url'];
    urlToImage = article['urlToImage'];
    publishedAt = article['publishedAt'];
    content = article['content'];
  }
}

List<Article> parseArticles(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Article.fromJson(json)).toList();
}