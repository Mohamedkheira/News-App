import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/api/api_manager.dart';
import 'package:news/data/model/sourceResponses/Source.dart';

class CategoryViewModel extends Cubit<CategoriesStates>{
  CategoryViewModel():super(CategoriesInitialState());
  loadSources(String categoryId)async{
    emit(CategoriesLoadingState());
    try{
    var sourcesResponse = await ApiManager.getSources(categoryId);
      if(sourcesResponse.status == "error"){
        emit(CategoriesErrorState(sourcesResponse.message??''));
      }else{
       emit(CategoriesSuccessState(sourcesResponse.sources??[]));
      }
    }catch(error){
      emit(CategoriesErrorState(error.toString()));

    }
  }
}

sealed class CategoriesStates{}

class CategoriesInitialState extends CategoriesStates{}

class CategoriesLoadingState extends CategoriesStates{}

class CategoriesErrorState extends CategoriesStates{
  String error;
  CategoriesErrorState(this.error);
}

class CategoriesSuccessState extends CategoriesStates{
  List<Source> sources;
  CategoriesSuccessState(this.sources);
}