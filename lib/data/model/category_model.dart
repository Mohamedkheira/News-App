import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String title;
  String imagePath;
  Color colorBackground;
  CategoryModel({required this.id,required this.title,required this.imagePath,required this.colorBackground});

static List<CategoryModel> categoryList = [
  CategoryModel(id: "sports", title: 'Sports', imagePath: 'sports.png', colorBackground: Color(0xffC91C22)),
  CategoryModel(id: "general", title: 'Politics', imagePath: 'Politics.png', colorBackground: Color(0xff003E90)),
  CategoryModel(id: "health", title: 'Health', imagePath: 'health.png', colorBackground: Color(0xffED1E79)),
  CategoryModel(id: "business", title: 'Business', imagePath: 'bussines.png', colorBackground: Color(0xffCF7E48)),
  CategoryModel(id: "technology", title: 'Technology', imagePath: 'environment.png', colorBackground: Color(0xff4882CF)),
  CategoryModel(id: "science", title: 'Science', imagePath: 'science.png', colorBackground: Color(0xffF2D352)),
];

}