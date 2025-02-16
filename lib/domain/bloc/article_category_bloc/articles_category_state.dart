part of 'articles_category_bloc.dart';

abstract class ArticlesCategoryState extends Equatable {
  const ArticlesCategoryState();

  @override
  List<Object> get props => [];
}

class ArticlesCategoryEmpty extends ArticlesCategoryState {
  final String message;
  const ArticlesCategoryEmpty() : message = 'No articles found';
   @override
  List<Object> get props => [message];
}

class ArticlesCategoryLoading extends ArticlesCategoryState {}

class ArticlesCategoryHasData extends ArticlesCategoryState {
  final List<ArticleEntity> articles;

  const ArticlesCategoryHasData({required this.articles});

  @override
  List<Object> get props => [articles];
}

class ArticlesCategoryError extends ArticlesCategoryState {
  final String message;

  const ArticlesCategoryError({required this.message});

  @override
  List<Object> get props => [message];
}
