import 'package:dio/dio.dart';
import 'package:card/models/category.list.item.model.dart';
import '../settings.dart';

class CategoryRepository {
  Future<List<CategoryListItemModel>> getAll() async {
    var url = "${Settings.apiUrl}ListEstabilishmentCategory";
    // ?card_number=" +
    //     Settings.cardNumber;
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => CategoryListItemModel.fromJson(course))
        .toList();
  }

  Future<List<CategoryListItemModel>> getByCity(city) async {
    var url = "${Settings.apiUrl}ListEstabilishmentCategory?card_number=" +
        Settings.cardNumber +
        "&idCity=" +
        city +
        "&page=1" +
        "&limit=20";

    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => CategoryListItemModel.fromJson(course))
        .toList();
  }
}
