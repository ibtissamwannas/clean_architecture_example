import 'dart:io';
import 'package:dartz/dartz.dart';

import '../../domain/entities/article_entity.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/article_repo.dart';

import '../datasource/article_remote_datasource.dart';


class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource remoteDataSource;

  ArticleRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ArticleEntity>>> getArticles() async {}

  @override
  Future<Either<Failure, List<ArticleEntity>>> getArticlesByCategory(
      String category) async {}
}
