import 'package:flutter/material.dart';
import 'package:news/ui/categories_details/ViewModel/CategoryDetailsViewModel.dart';
import 'package:news/ui/categories_details/widget/NewsListWidget/news_list.dart';
import 'package:news/ui/categories_details/widget/sources_tab.dart';
import 'package:provider/provider.dart';

class CategoriesDetailsTab extends StatefulWidget {
  final String categoryId;
  const CategoriesDetailsTab({super.key, required this.categoryId});

  @override
  State<CategoriesDetailsTab> createState() => _CategoriesDetailsTabState();
}

class _CategoriesDetailsTabState extends State<CategoriesDetailsTab> {

    CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider(
     create: (context) => viewModel,
     child:  Consumer<CategoryDetailsViewModel>(
         builder: (context, categoriesDetailsViewModel, child) {
           if(categoriesDetailsViewModel.isLoading){
             return Center(child: CircularProgressIndicator());
           }
           if(categoriesDetailsViewModel.errorMessage!=null){
             return Column(
               children: [
                 Text(categoriesDetailsViewModel.errorMessage??""),
                 ElevatedButton(onPressed: (){
                   categoriesDetailsViewModel.loadSources(widget.categoryId);
                 }, child: Text('Try Again'))
               ],
             );
           }
           return  DefaultTabController(
             length: categoriesDetailsViewModel.sourcesList?.length??0,
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
                     tabs: categoriesDetailsViewModel.sourcesList?.map((source) => SourcesTabWidget(source: source,)).toList()??[],
           ),
                 Expanded(
                     child: TabBarView(
                         children: categoriesDetailsViewModel.sourcesList?.map((source) => NewsListWidget(source: source,)).toList()??[]
                     ),
                 ),
               ],
             ),
           );
         },
     ),
   );

    /*return FutureBuilder(
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
    );*/
  }
}
