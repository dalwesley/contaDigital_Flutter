import 'package:dio/dio.dart';
import 'package:card/models/cities.model.dart';
import '../settings.dart';

class CitiesRepository {
  Future<List<CitiesModel>> getAll() async {
    var url = "${Settings.apiUrl}ListCity";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => CitiesModel.fromJson(course))
        .toList();
  }
}
