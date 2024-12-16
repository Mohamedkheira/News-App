import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/ui/categories_details/viewModel/CategoryDetailsViweModel.dart';
import 'package:news/ui/categories_details/widget/NewsListWidget/news_list.dart';
import 'package:news/ui/categories_details/widget/sources_tab.dart';

class CategoriesDetailsTab extends StatefulWidget {
  final String categoryId;
  const CategoriesDetailsTab({super.key, required this.categoryId});

  @override
  State<CategoriesDetailsTab> createState() => _CategoriesDetailsTabState();
}

class _CategoriesDetailsTabState extends State<CategoriesDetailsTab> {
  CategoryViewModel viewModel = CategoryViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => viewModel,
      child: BlocBuilder<CategoryViewModel,CategoriesStates>(
        builder: (context, state) {
        switch(state){

          case CategoriesInitialState():{
            return Container();
          }

          case CategoriesLoadingState():{
            return Center(child: CircularProgressIndicator(),);
          }
          case CategoriesErrorState():{
           return Column(
             spacing: 5,
              children: [
                Text(state.error),
                ElevatedButton(onPressed: (){
                  viewModel.loadSources(widget.categoryId);
                }, child: Text('Try Again'))
              ],
            );
            }
            case CategoriesSuccessState():{
                return  DefaultTabController(
                  length: state.sources.length,
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
                          tabs: state.sources
                              .map((source) => SourcesTabWidget(source: source,))
                              .toList()),
                      Expanded(
                        child: TabBarView(
                          children: state.sources.map((source) => NewsListWidget(source: source,)).toList(),
                        ),
                      ),
                    ],
                  ),
                );
            }
        }
      },),
    );

    /*FutureBuilder(
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
                Expanded(
                    child: TabBarView(
                        children: source.map((source) => NewsListWidget(source: source,)).toList(),
                    ),
                ),
              ],
            ),
          );
        },
    );*/
  }
}
