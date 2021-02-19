import 'package:dio/dio.dart';
import '../models/user.model.dart';
import '../settings.dart';

class UserDetailsRepository {
  var cardCaminho = "CardStatus?card_number="; //homologacao

  Future<UserModel> getUserDetails(getUserDetails) async {
    var url = "${Settings.apiUrl}ConvDetails?card_number=" + getUserDetails;
    Response response = await Dio().get(url);
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> add(UserModel model) async {
    var url = "${Settings.apiUrl}UpdateCardDetails?card_number=" +
        model.userCardNunber;

    try {
      Response response = await Dio().put(
        url,
        data: model,
      );
      return UserModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }
}
