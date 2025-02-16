import 'dart:async';

import 'package:clean_architecture_example/domain/usecases/article_usercases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../entities/article_entity.dart';

part 'articles_category_event.dart';
part 'articles_category_state.dart';

class ArticlesByCategoryBloc
    extends Bloc<ArticlesCategoryEvent, ArticlesCategoryState> {
  final GetArticleListByCategoryUseCase getArticleListByCategoryUseCase;

  ArticlesByCategoryBloc({required this.getArticleListByCategoryUseCase})
      : super(ArticlesCategoryEmpty()) {
    on<FetchArticlesByCategory>(fetchArticlesByCategory);
  }

  FutureOr<void> fetchArticlesByCategory(
    event,
    emit,
  ) async {
    emit(ArticlesCategoryLoading());
    final category = event.category;
    final result = await getArticleListByCategoryUseCase.execute(category);
    result.fold(
        (failure) => emit(ArticlesCategoryError(message: failure.message)),
        (articles) {
      if (articles.isEmpty) {
        emit(ArticlesCategoryEmpty());
      } else {
        emit(ArticlesCategoryHasData(articles: articles));
      }
    });
  }
}
