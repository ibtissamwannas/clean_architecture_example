import 'package:clean_architecture_example/presentation/widgets/home/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_news_app/presentation/widgets/home/category_widget.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            CategoryWidget(
              category: 'sport',
              categoryCardName: 'Sport',
              image: 'assets/sports.png',
            ),
            CategoryWidget(
              category: 'business',
              categoryCardName: 'Business',
              image: 'assets/business.png',
            ),
            CategoryWidget(
              category: 'health',
              categoryCardName: 'Health',
              image: 'assets/health.png',
            ),
            CategoryWidget(
              category: 'science',
              categoryCardName: 'Science',
              image: 'assets/science.png',
            ),
            CategoryWidget(
              category: 'technology',
              categoryCardName: 'Technology',
              image: 'assets/technology.png',
            ),
            CategoryWidget(
              category: 'entertainment',
              categoryCardName: 'Entertainment',
              image: 'assets/entertainment.png',
            ),
          ],
        ),
      ),
    );
  }
}
