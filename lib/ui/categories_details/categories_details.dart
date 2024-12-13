import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/sourceResponses/Source.dart';
import 'package:news/ui/categories_details/widget/news_list.dart';
import 'package:news/ui/categories_details/widget/sources_tab.dart';

class CategoriesDetailsTab extends StatefulWidget {
  String categoryId;
  CategoriesDetailsTab({super.key, required this.categoryId});

  @override
  State<CategoriesDetailsTab> createState() => _CategoriesDetailsTabState();
}

class _CategoriesDetailsTabState extends State<CategoriesDetailsTab> {
  List<String> sourceName = [
    "BBC News",
    "CBC News",
    "Al Ahly",
    "Sky News",
    "MBC News",
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.categoryId),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError || snapshot.data?.status =="error"){
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
          List<Source> source = snapshot.data?.sources??[];
          return  DefaultTabController(
            length: source.length,
            child: Column(
              children: [
                TabBar(
                    padding: EdgeInsets.all(16),
                    tabAlignment: TabAlignment.start,
                    labelColor: Colors.white,
                    dividerHeight: 0,
                    unselectedLabelColor: Theme.of(context).colorScheme.primary,
                    indicator: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary)),
                    isScrollable: true,
                    tabs: source
                        .map((source) => SourcesTabWidget(source: source,))
                        .toList()),
                NewsListWidget(sourceName: source,),
              ],
            ),
          );
        },
    );
  }
}
