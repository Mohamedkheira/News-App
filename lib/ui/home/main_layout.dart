import 'package:flutter/material.dart';
import 'package:news/search/search_screen.dart';
import 'package:news/style/app_style.dart';
import 'package:news/ui/categories/categories_tab.dart';
import 'package:news/ui/categories_details/categories_details.dart';
import 'package:news/ui/home/widget/custom_drawer.dart';
import 'package:news/ui/settings/settings_tab.dart';

class MainLayoutScreen extends StatefulWidget {
  static const String routeName = 'main';

  MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  late Widget selectedTap ;
@override
  void initState() {
    // TODO: implement initState
    selectedTap = CategoriesTab(onCategoryClick: selectedCategoryTab,);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
       color: AppStyle.colorText,
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News App',
          ),
          actions: [
            IconButton(
                onPressed: () => showSearch(context: context,delegate: SearchScreen()) , icon: const Icon(Icons.search))
          ],
        ),
        drawer: CustomDrawer(
          onTab: SelectDrawerTab,
        ),
        body: selectedTap,
      ),
    );
  }

  SelectDrawerTab(MenuTab tab){
    Navigator.pop(context);
  switch(tab){

    case MenuTab.Catogery:{
        selectedTap = CategoriesTab(onCategoryClick: selectedCategoryTab,);
      }
      case MenuTab.Settings:{
        selectedTap = SettingsTab();

      }

  }
  setState(() {

  });
  }


  selectedCategoryTab(String categoryId){
    selectedTap = CategoriesDetailsTab(categoryId: categoryId,);
    setState(() {
      
    });
  }
}
