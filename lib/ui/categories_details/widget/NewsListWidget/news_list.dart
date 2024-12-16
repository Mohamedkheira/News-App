import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/model/sourceResponses/Source.dart';
import 'package:news/ui/categories_details/widget/NewsListWidget/ViewModel/NewsViewModel.dart';
import 'package:news/ui/home/widget/article_item.dart';

class NewsListWidget extends StatefulWidget {
  final Source source;
  const NewsListWidget({super.key,required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  NewsViewModel newsViewModel = NewsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsViewModel.loadArticles(widget.source.id??"");
  }
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => newsViewModel,
      child: BlocBuilder<NewsViewModel,NewsState>(
        builder: (context, state) {
          switch(state){

            case NewsInitialState():{
              return Container();
            }
            case NewsLoadingState():
              return Center(child: CircularProgressIndicator(),);
            case NewsErrorState():
             return Column(
               spacing: 5,
               children: [
                 Text(state.error),
                 ElevatedButton(onPressed: (){
                   newsViewModel.loadArticles(widget.source.id??"");
                 }, child: Text('Try Again'))
               ],
             );
            case NewsSuccessState():
             return ListView.separated(
               itemBuilder: (BuildContext context, int index) =>
                   ArticleItem(article: state.articles[index] ) ,
               separatorBuilder: (BuildContext context, int index) => const SizedBox(
                 height: 10,
               ),
               itemCount: state.articles.length,

             );
          }
        },
      ),
    );


    /*FutureBuilder(
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
    );*/
  }
}
