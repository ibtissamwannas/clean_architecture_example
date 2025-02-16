import 'package:clean_architecture_example/data/models/article.dart';
import 'package:equatable/equatable.dart';

class Articles extends Equatable {
  final int totalResults;
  final List<Article> articles;

  const Articles({
    required this.totalResults,
    required this.articles,
  });

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        totalResults: json['totalResults'],
        articles: List<Article>.from(
          (json["articles"] as List).map((x) => Article.fromJson(x)).where(
                (article) =>
                    article.urlToImage != null && article.publishedAt != null,
              ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "articles": articles.map((article) => article.toJson()).toList(),
      };

  @override
  List<Object?> get props => [totalResults, articles];
}
