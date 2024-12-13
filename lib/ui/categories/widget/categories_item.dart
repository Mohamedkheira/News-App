import 'package:flutter/material.dart';
import 'package:news/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  final void Function() onTab;
  const CategoryItem({super.key, required this.categoryModel,required this.index, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.colorBackground,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(25),
            topEnd: Radius.circular(25),
            bottomStart: index.isEven ? Radius.circular(25): Radius.zero,
            bottomEnd: index.isEven ? Radius.zero : Radius.circular(25),
          )
        ),
        child: Column(
          children: [
            Image.asset("assets/images/${categoryModel.imagePath}",
              height: MediaQuery.of(context).size.height*0.15,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                categoryModel.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
