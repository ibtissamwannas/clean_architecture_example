
import 'package:clean_architecture_example/core/theme.dart';
import 'package:clean_architecture_example/domain/entities/article_entity.dart';
import 'package:clean_architecture_example/presentation/pages/article_page.dart';
import 'package:clean_architecture_example/presentation/widgets/image_container.dart';

import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final ArticleEntity article;

  const ArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticlePage(article: article),
          ),
        ),
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 16,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            ImageContainer(
              width: 120,
              height: 120,
              margin: const EdgeInsets.all(10.0),
              borderRadius: 5,
              imageUrl: article.urlToImage! ??
                  'https://img.freepik.com/free-photo/closeup-shot-bee-chamomile-flower_181624-31930.jpg',
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    article.title ?? 'No Title',
                    style: blackTextStyle.copyWith(fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.author ?? 'No Author',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
