import 'package:dartz/dartz.dart';

import '../entities/article_entity.dart';
import '../failures/failures.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<ArticleEntity>>> getArticles();
  Future<Either<Failure, List<ArticleEntity>>> getArticlesByCategory(
      String category);
}
