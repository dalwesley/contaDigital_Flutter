import 'package:flutter/widgets.dart';
import 'package:card/models/extract.details.model.dart';
import 'package:card/models/extract.model.dart';
import 'package:card/repositories/extract.details.repository.dart';
import 'package:card/repositories/extract.repository.dart';

class ExtractBloc extends ChangeNotifier {
  final extractDetailsRepository = new ExtractDetailsRepository();
  final extractRepository = new ExtractRepository();

  List<ExtractDetailsModel> extractDetails;
  List<ExtractModel> extract;
  String selectedDays = '0';

  ExtractBloc() {
    getExtract();
    getExtractDetails();
  }

  getExtract() {
    extractRepository.getAll(selectedDays).then((data) {
      this.extract = data;
      notifyListeners();
    });
  }

  getExtractDetails() {
    extractDetailsRepository.getAll().then((data) {
      this.extractDetails = data;
      notifyListeners();
    });
  }

  getByDay() {
    extractDetailsRepository.getAll().then((data) {
      this.extractDetails = data;
      notifyListeners();
    });
  }

  changeDay(days) {
    selectedDays = days.toString();
    extractDetails = null;
    getByDay();
    notifyListeners();
  }
}
