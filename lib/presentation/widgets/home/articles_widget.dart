
import 'package:clean_architecture_example/domain/bloc/articles_bloc/articles_bloc.dart';
import 'package:clean_architecture_example/presentation/widgets/article/loading_article_list.dart';
import 'package:clean_architecture_example/presentation/widgets/article_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoading) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8),
            child: const LoadingArticleList(),
          );
        } else if (state is ArticlesLoaded) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                var article = state.articles[index];
                return ArticleCard(article: article);
              },
            ),
          );
        } else if (state is ArticlesEmpty) {
          return const Center(child: Text('Empty Article'));
        } else if (state is ArticlesError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}
