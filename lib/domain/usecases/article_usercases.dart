import 'package:clean_architecture_example/domain/entities/article_entity.dart';
import 'package:clean_architecture_example/domain/failures/failures.dart';
import 'package:clean_architecture_example/domain/repositories/article_repo.dart';
import 'package:dartz/dartz.dart';

class GetArticleListUseCase {
  final ArticleRepository _articleRepository;

  GetArticleListUseCase(this._articleRepository);

  Future<Either<Failure, List<ArticleEntity>>> execute() {
    return _articleRepository.getArticles();
  }
}

class GetArticleListByCategoryUseCase {
  final ArticleRepository _articleRepository;

  GetArticleListByCategoryUseCase(this._articleRepository);

  Future<Either<Failure, List<ArticleEntity>>> execute(String category) {
    return _articleRepository.getArticlesByCategory(category);
  }
}
