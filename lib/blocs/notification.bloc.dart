import 'package:flutter/widgets.dart';
import 'package:card/models/notification.model.dart';
import 'package:card/repositories/notification.repository.dart';

class NotificationBloc extends ChangeNotifier {
  final notificationRepository = new NotificationRepository();

  List<NotificationModel> notification;

  NotificationBloc() {
    getNotificationById();
  }

  getNotificationById() {
    notificationRepository.getAll().then((data) {
      this.notification = data;
      notifyListeners();
    });
  }
}
