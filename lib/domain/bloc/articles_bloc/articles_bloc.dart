import 'dart:async';

import 'package:clean_architecture_example/domain/usecases/article_usercases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../entities/article_entity.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final GetArticleListUseCase getArticleListUseCase;

  ArticlesBloc({required this.getArticleListUseCase}) : super(ArticlesEmpty()) {
    on<ArticlesEvent>(fetchArticles);
  }

  FutureOr<void> fetchArticles(
    ArticlesEvent event,
    Emitter<ArticlesState> emit,
  ) async {
    emit(ArticlesLoading());
    final result = await getArticleListUseCase.execute();
    result.fold((failure) => emit(ArticlesError(message: failure.message)),
        (articles) {
      if (articles.isEmpty) {
        emit(ArticlesEmpty());
      } else {
        emit(ArticlesLoaded(articles: articles));
      }
    });
  }
}
