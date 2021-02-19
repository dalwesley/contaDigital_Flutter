import 'package:flutter/material.dart';
import 'package:card/models/notification.model.dart';

import '../../loader.widget.dart';
import 'notification.card.widget.dart';

class NotificationList extends StatelessWidget {
  final List<NotificationModel> notification;

  NotificationList({@required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      // width: 500,
      child: Loader(
        object: notification,
        callback: list,
      ),
    );
  }

  Widget list() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: List.generate(notification.length, (index) {
          NotificationModel item = notification[index];
          return NotificationCard(
            item: item,
          );
        }),
      ),
    );
  }
}
