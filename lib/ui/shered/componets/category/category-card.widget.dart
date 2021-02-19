import 'package:flutter/material.dart';
import 'package:card/blocs/home.bloc.dart';
import 'package:card/models/category.list.item.model.dart';
import 'package:flutter/widgets.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/android/views/home-estabilishment.view.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  final CategoryListItemModel item;

  CategoryCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10)),
      color: item.id.toString() == bloc.selectedCategory
          ? accentColor
          : backgroundColor,
      elevation: 1,
      child: FlatButton(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Text(
                item.id.toString(),
                style: item.id.toString() == bloc.selectedCategory
                    ? TextStyle(
                        fontSize: 15,
                        color: backgroundColor,
                        fontWeight: FontWeight.w700,
                      )
                    : TextStyle(fontSize: 15, color: primaryColor),
              ),
            ),
            Container(
              child: Text(
                item.name,
                style: item.id.toString() == bloc.selectedCategory
                    ? TextStyle(
                        fontSize: 11,
                        color: backgroundColor,
                        fontWeight: FontWeight.w700,
                      )
                    : TextStyle(fontSize: 11, color: primaryColor),
                textAlign: TextAlign.left,
                // overflow: TextOverflow.ellipsis,
                // maxLines: 3,
                // softWrap: true,
              ),
            ),
          ],
        ),
        //     Image.asset("assets/categories/${Settings.theme}/${item.name}.png"),
        onPressed: () {
          bloc.changeCategory(
            item.idCity.toString(),
            item.id.toString(),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeEstabilishmentView(
                category: item.customAssetName,
              ),
            ),
          );
        },
      ),
    );
  }
}
