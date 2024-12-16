import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/data/model/NewsResponse/Article.dart';
import 'package:news/ui/detils_screen/details_screen.dart';
import 'package:timeago/timeago.dart' as timeago;


class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () =>    Navigator.pushNamed(context, DetailsScreen.routeName,arguments: article),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(imageUrl: article.urlToImage??"",
           height: MediaQuery.of(context).size.height*.4,
           width: double.infinity,
           placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
           errorWidget: (context, url, error) => const Center(child: Icon(Icons.error,size: 25,),),
           imageBuilder: (context, imageProvider) => Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               image: DecorationImage(image: imageProvider,fit: BoxFit.cover),
             ),
           ),
            ),
            Text(
              article.source?.name??"",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              article.title??"",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(timeago.format(DateTime.parse(article.publishedAt??"")),style: const TextStyle(
                color: Color(0xff79828B),
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),),
            )
          ],
        ),
      ),
    );
  }
}
