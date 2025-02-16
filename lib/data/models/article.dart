
import 'package:clean_architecture_example/domain/entities/article_entity.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  const Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final String? author;
  final String? title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json['author'],
        title: json['title'],
        description: json['description'] ?? "-",
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: DateTime.parse(json['publishedAt']),
        content: json['content'],
      );

  Map<String, dynamic> toJson() => {
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt?.toIso8601String(),
        'content': content,
      };

  ArticleEntity toEntity() {
    return ArticleEntity(
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }

  @override
  List<Object?> get props => [
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}
