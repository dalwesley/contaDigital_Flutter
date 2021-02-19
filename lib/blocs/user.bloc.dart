import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:card/models/authenticate.model.dart';
import 'package:card/models/cardstatus.model.dart';
import 'package:card/models/password.model.dart';
import 'package:card/models/user.model.dart';
import 'package:card/repositories/account.repository.dart';
import 'package:card/repositories/card.status.repository.dart';
import 'package:card/repositories/user.repository.dart';
import 'package:card/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends ChangeNotifier {
  var user = new UserModel();
  var cardAuthenticate = new AuthenticateModel();
  var cardStatus = new CardStatusModel();
  var passwordModel = new PasswordModel();

  final userDetailsRepository = new UserDetailsRepository();
  var userModel = new UserModel();

  UserBloc() {
    user = null;
    loadUser();
    details(Settings.cardNumber);
  }

  Future<UserModel> details(cardNumber) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var _userDetailsRepository = new UserDetailsRepository();
      var resp = await _userDetailsRepository.getUserDetails(cardNumber);
      Settings.userModel = resp;

      userModel = resp;
      await prefs.setString('userModel', jsonEncode(resp));

      return resp;
    } catch (ex) {
      print(ex);
      userModel = null;
      return null;
    }
  }

  Future<CardStatusModel> status(cardNumber) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var _cardNumberRepository = new CardStatusRepository();
      var res = await _cardNumberRepository.cardStatus(cardNumber);
      Settings.cardNumber = cardNumber;

      cardStatus = res;
      await prefs.setString('cardStatus', jsonEncode(res));

      return res;
    } catch (ex) {
      print(ex);
      cardStatus = null;
      return null;
    }
  }

  Future<AuthenticateModel> authenticate(cardNumber, cardPassword) async {
    try {
      // var prefs = await SharedPreferences.getInstance();
      var repository = new AccountRepository();
      var res = await repository.authenticate(cardNumber, cardPassword);
      cardAuthenticate = res;
      // await prefs.setString('user', jsonEncode(res));

      return res;
    } catch (ex) {
      print(ex);
      user = null;
      return null;
    }
  }

  Future<AuthenticateModel> createPassword(model) async {
    try {
      var repository = new AccountRepository();
      var res = await repository.add(model);
      return res;
    } catch (ex) {
      print(ex);
      user = null;
      return ex;
    }
  }

  Future acceptLgpd(dado) async {
    try {
      var repository = new AccountRepository();
      var res = await repository.addLgpd(dado);
      return res;
    } catch (ex) {
      print(ex);
      user = null;
      return null;
    }
  }

  Future<UserModel> editUser(UserModel model) async {
    try {
      var repository = new UserDetailsRepository();
      var res = await repository.add(model);
      return res;
    } catch (ex) {
      print(ex);
      user = null;
      return null;
    }
  }

  logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', null);
    user = null;
    notifyListeners();
  }

  Future loadUser() async {
    var prefs = await SharedPreferences.getInstance();
    var _userDetailsRepository = new UserDetailsRepository();
    var res = await _userDetailsRepository.getUserDetails(Settings.cardNumber);
    Settings.userModel = res;
    user = res;
  }
}
