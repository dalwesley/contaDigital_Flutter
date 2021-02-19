import 'package:card/models/category.list.item.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../loader.widget.dart';
import 'category-card.widget.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryListItemModel> categories;

  CategoryList({@required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      // width: 500,
      child: Loader(
        object: categories,
        callback: list,
      ),
    );
  }

  Widget list() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(categories.length, (index) {
          CategoryListItemModel item = categories[index];
          return CategoryCard(
            item: item,
          );
        }),
      ),
    );
  }
}
