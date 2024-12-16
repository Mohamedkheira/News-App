import 'package:flutter/material.dart';
import 'package:news/data/model/category_model.dart';
import 'package:news/ui/categories/widget/categories_item.dart';

class CategoriesTab extends StatelessWidget {
  final void Function(String) onCategoryClick;
  const CategoriesTab({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 35.0,
        start: 35.0,
        end: 35.0,
      ),
      child: Column(
        children: [
          Text('Pick your category of interest', style: Theme
              .of(context)
              .textTheme
              .headlineLarge,
            maxLines: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
                  childAspectRatio: 1/1.3
                ),
                itemBuilder: (context, index) => CategoryItem(
                  onTab: (){
                    onCategoryClick(CategoryModel.categoryList[index].id);
                  },
                  categoryModel: CategoryModel.categoryList[index],
                  index: index,
                ),
              itemCount: CategoryModel.categoryList.length,
            ),
          )
        ],
      ),
    );
  }
}