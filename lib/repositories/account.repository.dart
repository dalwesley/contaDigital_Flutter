import 'package:dio/dio.dart';
import 'package:card/models/authenticate.model.dart';
import 'package:card/models/cardstatus.model.dart';
import 'package:card/models/user.model.dart';
import '../settings.dart';

class AccountRepository {
  var cardCaminho = "CardStatus?card_number="; //homologacao

  Future<CardStatusModel> cardStatus(cardNumber) async {
    var url = "${Settings.apiUrl}" + cardCaminho + cardNumber;
    Response response = await Dio().get(url);
    return CardStatusModel.fromJson(response.data);
  }

  Future<AuthenticateModel> authenticate(cardNumber, cardPassword) async {
    var url = "${Settings.apiUrl}" +
        "CardValidate?card_number=" +
        cardNumber +
        "&password=" +
        cardPassword;
    Response response = await Dio().get(url);
    return AuthenticateModel.fromJson(response.data);
  }

  Future<UserModel> create(UserModel model) async {
    var url = "${Settings.apiUrl}v1/account";
    Response response = await Dio().post(url, data: model);
    return UserModel.fromJson(response.data);
  }

  Future<AuthenticateModel> add(model) async {
    var url = "${Settings.apiUrl}UpdateCardPassword";
    Response response = await Dio().put(url, data: model);
    return AuthenticateModel.fromJson(response.data);
  }

  Future addLgpd(dado) async {
    var url = "${Settings.apiUrl}UpdateTermsLGPD?card_number=" + dado;
    Response response = await Dio().put(url);
    return (response.statusCode);
  }

  //   Future addLgpd(dado) async {
  //   var url = "${Settings.apiUrl}UpdateTermsLGPD";
  //   Response response = await Dio().put(url, data: dado);
  //   return (response.data);
  // }

  //   Future addLgpd(dado) async {
  //   var url = "${Settings.apiUrl}UpdateTermsLGPD?card_number=" + dado;
  //   Response response = await Dio().put(url);
  //   return (response.data);
  // }

}
