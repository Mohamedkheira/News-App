import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse/Article.dart';

class NewsViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  List<Article>? articles;
  loadNews(String sourceId)async{
  isLoading = true;
  errorMessage = null;
  articles = null;
  notifyListeners();
    try{
    var newsResponse = await ApiManager.getNews(sourceId);
      if(newsResponse.status=='error'){
        isLoading = false;
        errorMessage = newsResponse.message;
        notifyListeners();
      }else{
        isLoading = false;
       articles = newsResponse.articles;
       notifyListeners();
      }
    }catch(error){
      isLoading = false;
        errorMessage = error.toString();
       notifyListeners();
    }
  }
}