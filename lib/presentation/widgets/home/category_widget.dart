
import 'package:clean_architecture_example/presentation/widgets/article/article_category_page.dart';
import 'package:clean_architecture_example/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String category;
  final String categoryCardName;
  final String image;
  const CategoryWidget({
    super.key,
    required this.category,
    required this.categoryCardName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticleCategoryPage(category: category),
        ),
      ),
      child: CategoryCard(categoryCardName, image),
    );
  }
}
