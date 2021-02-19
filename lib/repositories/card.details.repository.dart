import 'package:dio/dio.dart';
import 'package:card/models/cardDetails.model.dart';
import '../settings.dart';

class CardDetailsRepository {
  var cardCaminho = "CardStatus?card_number="; //homologacao

  Future<CardDetailsModel> getCardDetails(cardNumber) async {
    var url = "${Settings.apiUrl}cardDetails?card_number=" + cardNumber;
    Response response = await Dio().get(url);
    return CardDetailsModel.fromJson(response.data);
  }
}
