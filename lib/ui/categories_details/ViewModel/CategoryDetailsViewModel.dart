import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/sourceResponses/Source.dart';


// provider
class CategoryDetailsViewModel extends ChangeNotifier{
  String? errorMessage;
  List<Source>? sourcesList;
  bool isLoading = false;
  // Function to call API
  loadSources(String categoryId) async {
    isLoading = true;
    errorMessage = null;
    sourcesList = null;
    notifyListeners();
    try{
      var sourcesResponse = await ApiManager.getSources(categoryId);
      // handel Error
      if(sourcesResponse.status=="error"){
        errorMessage = sourcesResponse.message;
        isLoading = false;
        notifyListeners();
      }else{
        // handel success -> sources reached successfully
        isLoading = false;
        sourcesList = sourcesResponse.sources;
        notifyListeners();
      }
    }catch(error){
      // handel Error
      isLoading = false;
      errorMessage = error.toString();
      notifyListeners();
    }
  }
}