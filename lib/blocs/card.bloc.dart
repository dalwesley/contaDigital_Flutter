import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:card/models/cardDetails.model.dart';
import 'package:card/repositories/card.details.repository.dart';
import 'package:card/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardBloc extends ChangeNotifier {
  final cardRepository = new CardDetailsRepository();
  var cardDetailsModel = new CardDetailsModel();

  CardBloc() {
    if (Settings.cardNumber != null) getDetails();
  }

  Future<CardDetailsModel> details(cardNumber) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var _cardDetailsRepository = new CardDetailsRepository();
      var res = await _cardDetailsRepository.getCardDetails(cardNumber);
      Settings.cardDetails = res;

      cardDetailsModel = res;
      await prefs.setString('cardDetailsModel', jsonEncode(res));

      return res;
    } catch (ex) {
      print(ex);
      cardDetailsModel = null;
      return null;
    }
  }

  getDetails() {
    cardRepository.getCardDetails(Settings.cardNumber).then((data) {
      this.cardDetailsModel = data;
      notifyListeners();
    });
  }
}
