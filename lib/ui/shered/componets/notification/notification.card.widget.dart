import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:card/models/notification.model.dart';
import 'package:card/themes/light.theme.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

import 'notification.cardDetail.widget.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel item;

  NotificationCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    void exibirNotificationCard() {
      slideDialog.showSlideDialog(
        context: context,
        barrierColor: primaryColor.withOpacity(0.7),
        pillColor: primaryColor,
        backgroundColor: Colors.white,
        child: EstabilishmentDetails(item: item),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            new BoxShadow(
              color: Colors.black26,
              offset: new Offset(1, 2.0),
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Expanded(
          child: ListTile(
            // leading: Icon(Icons.add),
            leading: item.notificationId.toString() == '1'
                ? Icon(FontAwesomeIcons.gift)
                : Icon(FontAwesomeIcons.percent),
            title: Text(
              item.titulo,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            // trailing: Icon(Icons.done),
            // subtitle: Text(item.texto),
            // selected: true,
            onTap: () {
              // bloc.changeCategory(
              //   item.number.toString(),
              // );

              exibirNotificationCard();
            },
          ),
        ),
      ),
    );
  }
}
