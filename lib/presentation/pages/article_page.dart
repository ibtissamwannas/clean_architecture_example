
import 'package:clean_architecture_example/core/theme.dart';
import 'package:clean_architecture_example/domain/entities/article_entity.dart';
import 'package:clean_architecture_example/presentation/widgets/custom_tag.dart';
import 'package:clean_architecture_example/presentation/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatefulWidget {
  final ArticleEntity article;

  const ArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      clipAll: true,
      width: double.infinity,
      imageUrl: widget.article.urlToImage ?? '',
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  const SizedBox(height: 10),
                  Text(
                    widget.article.title ?? 'No Title',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.25),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.article.description ?? 'No Description',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomTag(
                        backgroundColor: Colors.black,
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundImage:
                                NetworkImage(widget.article.urlToImage!),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            widget.article.author ?? 'UnKnown',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.article.title ?? 'No Title',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.article.content ?? 'No Content',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () => launchUrl(
                      Uri.parse(widget.article.url),
                      mode: LaunchMode.inAppWebView,
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(55),
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultRadius),
                      ),
                    ),
                    child: Text(
                      'Read The News',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
