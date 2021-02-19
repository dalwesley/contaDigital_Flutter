import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:card/models/estabilishment.model.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/shered/componets/estabilishment/estabilishment-details.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

class EstabilishmentCard extends StatelessWidget {
  final EstabilishmentModel item;

  EstabilishmentCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    void exibirEstabilishmentCard() {
      slideDialog.showSlideDialog(
        context: context,
        barrierColor: primaryColor.withOpacity(0.7),
        pillColor: primaryColor,
        backgroundColor: Colors.white,
        child: EstabilishmentDetails(item: item),
      );
    }

    return Card(
      // color: item.businessName == bloc.selectedCategory
      //     ? Theme.of(context).primaryColor
      //     : Colors.white,
      elevation: 1,
      child: FlatButton(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Container(
            //   child: Text(item.businessName),
            // ),
            Text(
              item.businessName,
              style: TextStyle(fontSize: 11, color: primaryColor),
              textAlign: TextAlign.left,
              // overflow: TextOverflow.ellipsis,
              // maxLines: 3,
              // softWrap: true,
            ),
            Text(
              item.city,
              style: TextStyle(fontSize: 10, color: primaryColor),
              textAlign: TextAlign.left,
              // overflow: TextOverflow.ellipsis,
              // maxLines: 3,
              // softWrap: true,
            ),
          ],
        ),
        //     Image.asset("assets/categories/${Settings.theme}/${item.name}.png"),
        onPressed: () {
          // bloc.changeCategory(
          //   item.number.toString(),
          // );

          exibirEstabilishmentCard();
        },
      ),
    );
  }
}
