import 'package:dio/dio.dart';
import 'package:card/models/estabilishment.model.dart';
import 'package:card/settings.dart';

class EstabilishmentRepository {
  Future<List<EstabilishmentModel>> getAll() async {
    var url = "${Settings.apiUrl}ListEstabilishment";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => EstabilishmentModel.fromJson(course))
        .toList();
  }

  Future<List<EstabilishmentModel>> getByCategory(category, city) async {
    var url = "${Settings.apiUrl}ListEstabilishment?card_number=" +
        Settings.cardNumber +
        "&category=" +
        category +
        "&idCity=" +
        city +
        "&page=1" +
        "&limit=20";
    // // ListEstabilishment/$category/products";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => EstabilishmentModel.fromJson(course))
        .toList();
  }
}
