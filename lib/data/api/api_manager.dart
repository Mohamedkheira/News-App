import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/data/model/NewsResponse/NewsResponse.dart';
import 'package:news/data/model/sourceResponses/SourcesResponce.dart';


class ApiManager{
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "84a493281cf74d68b8e1c86301091f85";
  static Future<SourcesResponse> getSources(String categoryId) async {
    // ?apiKey=&category=sports
    Uri sourcesApi = Uri.https(baseUrl,"/v2/top-headlines/sources",{
      "apiKey":apiKey,
      "category":categoryId
    });
  http.Response response = await http.get(sourcesApi);
  Map<String,dynamic> json = jsonDecode(response.body);
  SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
  return sourcesResponse;
  }

static Future<NewsResponse> getNews(String sourceId) async {
   Uri newsUrl = Uri.https(baseUrl,"/v2/everything",{
     "apiKey":apiKey,
      "sources": sourceId,
   });
    http.Response response = await http.get(newsUrl);
    Map<String,dynamic> json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }


  static Future<NewsResponse?> getSearch(String search) async {
   try {
     Uri searchUrl = Uri.https(baseUrl, "/v2/top-headlines", {
       "apiKey": apiKey,
       "q": search,
     });
     final response = await http.get(searchUrl);
     final json = jsonDecode(response.body);
     NewsResponse? newsResponse = await NewsResponse.fromJson(json);
     if(newsResponse.message == null){
       return newsResponse;
     } else if(newsResponse.message != null){
       throw newsResponse.message!;
     }
     return newsResponse;
   }catch(error) {
     print("-----------------qr");
      print(error);
     rethrow;
   }
  }
}