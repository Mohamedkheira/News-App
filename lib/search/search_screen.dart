import 'package:flutter/material.dart';
import 'package:news/data/api/api_manager.dart';
import 'package:news/search/widget/news_item.dart';

class SearchScreen extends SearchDelegate{



  @override
  // TODO: implement query
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
   return [
     IconButton(
         onPressed: (){
           showResults(context);
         },
         icon: const Icon(Icons.search))
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
   return IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back_ios_rounded)) ;
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSearch(query),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError || snapshot.data?.status =="error") {
            return Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
                ElevatedButton(onPressed: () {

                }, child: Text('Try Again'))
              ],
            );
          }
          final news = snapshot.data?.articles ??[];
          return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) => NewsItem(article: news[index]),);
        },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
  @override
  ThemeData appBarTheme(BuildContext context){
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(

      )
    );
  }

}