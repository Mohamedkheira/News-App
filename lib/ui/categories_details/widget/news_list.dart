import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse/Article.dart';
import 'package:news/model/NewsResponse/NewsResponse.dart';
import 'package:news/model/article_model.dart';
import 'package:news/model/sourceResponses/Source.dart';
import 'package:news/ui/home/widget/article_item.dart';

class NewsListWidget extends StatefulWidget {
  final Source source;
  const NewsListWidget({super.key,required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNews(widget.source.id??""),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasError || snapshot.data?.status == "error"){
          return Column(
            children: [
              Text(snapshot.data?.message??snapshot.error.toString()),
              ElevatedButton(onPressed: (){
                setState(() {

                });
              }, child: Text('Try Again'))
            ],
          );
        }
        List<Article> articles = snapshot.data?.articles??[];
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) =>
              ArticleItem(article: articles[index] ) ,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 10,
          ),
          itemCount: articles.length,

        );
      },
    );
  }
}
