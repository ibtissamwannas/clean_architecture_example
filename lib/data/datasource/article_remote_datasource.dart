import 'dart:convert';
import 'package:clean_architecture_example/core/const.dart';
import 'package:clean_architecture_example/data/exceptions/exception.dart';
import 'package:clean_architecture_example/data/models/article.dart';
import 'package:clean_architecture_example/data/models/articles.dart';
import 'package:http/http.dart' as http;


abstract class ArticleRemoteDataSource {
  Future<List<Article>> getArticles();
  Future<List<Article>> getArticleByCategory(String category);
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final http.Client client;

  ArticleRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Article>> getArticles() async {
    final response = await client.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      return Articles.fromJson(json.decode(response.body)).articles;
    } else {
      throw ServerException(response.body);
    }
  }

  @override
  Future<List<Article>> getArticleByCategory(String category) async {
    final response = await client.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      return Articles.fromJson(json.decode(response.body)).articles;
    } else {
      throw ServerException(response.body);
    }
  }
}
