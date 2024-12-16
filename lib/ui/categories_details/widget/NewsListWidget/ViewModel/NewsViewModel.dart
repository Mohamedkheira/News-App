import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/api/api_manager.dart';
import 'package:news/data/model/NewsResponse/Article.dart';

class NewsViewModel extends Cubit<NewsState>{
  NewsViewModel():super(NewsInitialState());
  loadArticles(String sourceId)async{
      emit(NewsLoadingState());
    try {
      var newsResponse = await ApiManager.getNews(sourceId);
      if(newsResponse.status=="error"){
        emit(NewsErrorState(newsResponse.message!));
      }else{
        emit(NewsSuccessState(newsResponse.articles??[]));
      }

    }catch(error){
      emit(NewsErrorState(error.toString()));
    }
  }
}


sealed class NewsState{}

class NewsInitialState extends NewsState {

}

class NewsLoadingState extends NewsState {

}

class NewsErrorState extends NewsState {
  String error;
  NewsErrorState(this.error);
}

class NewsSuccessState extends NewsState {
  List<Article> articles;
  NewsSuccessState(this.articles);
}