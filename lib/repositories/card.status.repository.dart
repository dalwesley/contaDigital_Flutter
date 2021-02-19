import 'package:dio/dio.dart';
import 'package:card/models/cardstatus.model.dart';
import 'package:card/settings.dart';

class CardStatusRepository {
  var caminho = "CardStatus?card_number="; //homologacao

  Future<CardStatusModel> cardStatus(cardNumber) async {
    var url = "${Settings.apiUrl}CardStatus?card_number=" + cardNumber;
    Response response = await Dio().get(url);
    return CardStatusModel.fromJson(response.data);
  }
}
