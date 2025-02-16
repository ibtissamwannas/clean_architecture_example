
import 'package:clean_architecture_example/core/theme.dart';
import 'package:clean_architecture_example/presentation/widgets/article/loading_article_list.dart';
import 'package:clean_architecture_example/presentation/widgets/article_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleCategoryPage extends StatefulWidget {
  final String category;
  const ArticleCategoryPage({Key? key, required this.category})
      : super(key: key);

  @override
  State<ArticleCategoryPage> createState() => _ArticleCategoryPageState();
}

class _ArticleCategoryPageState extends State<ArticleCategoryPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context
          .read<ArticleCategoryBloc>()
          .add(FetchArticlesByCategory(widget.category)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0.0,
        title: Text(
          widget.category,
          style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
        ),
      ),
      body: BlocBuilder<ArticleCategoryBloc, ArticleCategoryState>(
        builder: (context, state) {
          if (state is ArticleCategoryLoading) {
            return const Padding(
              padding: EdgeInsets.only(top: 8),
              child: LoadingArticleList(),
            );
          } else if (state is ArticleCategoryHasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  var article = state.articles[index];
                  return ArticleCard(article: article);
                },
              ),
            );
          } else if (state is ArticleCategoryEmpty) {
            return Center(child: Text(state.message));
          } else if (state is ArticleCategoryError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
    );
  }
}
