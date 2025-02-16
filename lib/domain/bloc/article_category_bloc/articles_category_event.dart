part of 'articles_category_bloc.dart';

abstract class ArticlesCategoryEvent extends Equatable {
  const ArticlesCategoryEvent();

  @override
  List<Object> get props => [];
}

class FetchArticlesByCategory extends ArticlesCategoryEvent {
  final String category;
  const FetchArticlesByCategory(this.category);
  @override
  List<Object> get props => [category];
}
