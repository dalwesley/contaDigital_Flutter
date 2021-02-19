import 'package:card/models/extract.model.dart';
import '../settings.dart';
import 'package:dio/dio.dart';

class ExtractRepository {
  Future<List<ExtractModel>> getAll(day) async {
    var url = "${Settings.apiUrl}CardStatement?card_number=" +
        Settings.cardNumber +
        "&day=" +
        day;
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => ExtractModel.fromJson(course))
        .toList();
  }
}
