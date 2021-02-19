import 'package:flutter/material.dart';
import 'package:card/blocs/home.bloc.dart';
import 'package:card/models/category.list.item.model.dart';
import 'package:card/ui/shered/componets/category/category-list.widget.dart';
import 'package:provider/provider.dart';

class HomeCategoryView extends StatelessWidget {
  final List<CategoryListItemModel> category;

  HomeCategoryView({@required this.category});
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);
    var size = MediaQuery.of(context).size;
    return category == null
        ? Container(
            width: size.width,
            height: size.height,
            child: LayoutBuilder(
              builder: (_, constraints) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.arrow_upward),
                        Text("Selecione uma cidade...",
                            style: Theme.of(context).textTheme.headline5),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Container(
            width: size.width,
            height: size.height,
            child: LayoutBuilder(
              builder: (_, constraints) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Expanded(
                    child: CategoryList(categories: category),
                  ),
                );
              },
            ),
          );
  }
}
