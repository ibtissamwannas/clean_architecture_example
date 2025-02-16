import 'dart:io';
import 'package:clean_architecture_example/data/exceptions/exception.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/article_entity.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/article_repo.dart';

import '../datasource/article_remote_datasource.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource remoteDataSource;

  ArticleRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ArticleEntity>>> getArticles() async {
    try {
      final articles = await remoteDataSource.getArticles();
      return Right(articles.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(ConnectionFailure('Fialed to connect to the server'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificate not valid:\n ${e.message}'));
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> getArticlesByCategory(
      String category) async {
    try {
      final articles = await remoteDataSource.getArticleByCategory(category);
      return Right(articles.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(ConnectionFailure('Fialed to connect to the server'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificate not valid:\n ${e.message}'));
    }
  }
}
