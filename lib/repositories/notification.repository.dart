import 'package:dio/dio.dart';
import 'package:card/models/notification.model.dart';
import 'package:card/settings.dart';

class NotificationRepository {
  Future<List<NotificationModel>> getAll() async {
    var url = "${Settings.apiUrl}/NotificationApp";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => NotificationModel.fromJson(course))
        .toList();
  }
}
