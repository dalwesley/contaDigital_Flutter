import 'package:flutter/material.dart';
import 'package:card/blocs/extract.bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:card/models/extract.model.dart';
import 'package:card/ui/android/views/home-estabilishment.view.dart';
import 'package:provider/provider.dart';

class ExtractCard extends StatelessWidget {
  final ExtractModel item;

  ExtractCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    final ExtractBloc bloc = Provider.of<ExtractBloc>(context);

    return Card(
      // shadowColor: item.id.toString() == bloc.selectedCategory
      //     ? Theme.of(context).primaryColor
      //     : Colors.white,
      // color: item.id.toString() == bloc.selectedCategory
      //     ? Theme.of(context).accentColor
      //     : Colors.white,
      elevation: 1,
      child: FlatButton(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Text(
                item.date,
              ),
            ),
            Container(
              child: Text(
                item.value,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        onPressed: () {
          bloc.changeDay(
            item.type.toString(),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeEstabilishmentView(
                category: item.date,
              ),
            ),
          );
        },
      ),
    );
  }
}
