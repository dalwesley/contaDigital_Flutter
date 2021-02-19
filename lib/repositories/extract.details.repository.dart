import 'package:card/models/extract.details.model.dart';
import '../settings.dart';
import 'package:dio/dio.dart';

class ExtractDetailsRepository {
  Future<List<ExtractDetailsModel>> getAll() async {
    var url =
        "${Settings.apiUrl}CardStatement?card_number=" + Settings.cardNumber;
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => ExtractDetailsModel.fromJson(course))
        .toList();
  }

  Future<List<ExtractDetailsModel>> getByCategory(category) async {
    var url = "${Settings.apiUrl}CardStatement?card_number=" +
        Settings.cardNumber +
        "&category=" +
        category +
        "&page=1" +
        "&limit=20";
    // // ListEstabilishment/$category/products";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => ExtractDetailsModel.fromJson(course))
        .toList();
  }
}
