import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/data/model/NewsResponse/Article.dart';
import 'package:news/ui/detils_screen/details_screen.dart';

class NewsItem extends StatelessWidget {
  final Article article;

  const NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () =>    Navigator.pushNamed(context, DetailsScreen.routeName,arguments: article),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              height: 0.25 * height,
              width: double.infinity,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(article.source?.name ?? ""),
          Text(article.title ?? ""),
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                article.publishedAt ?? "",
              )),
        ],
      ),
    );
  }
}
