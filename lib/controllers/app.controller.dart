import 'package:card/repositories/extract.repository.dart';
import 'package:card/store/app.store.dart';

class AppController {
  AppStore _store;
  // ExtractRepository _categoryRepository;
  // CardRepository _cardNumberRepository;

  ExtractRepository _extractRepository;
  // ExtractDetailsRepository _extractDetailsRepository;

  AppController(AppStore store) {
    _store = store;
    _extractRepository = new ExtractRepository();
  }

  void changeSelection(String selection) {
    _store.clearExtract();
    // var hoje = _dateFormat.format(date);
    switch (selection) {
      case "0":
        {
          _store.busy = true;
          _store.changeSelectedExtract("0");
          _extractRepository.getAll("0").then(
            (data) {
              _store.setExtract(data);
              _store.busy = false;
            },
          );
          return;
        }
      case "5":
        {
          _store.busy = true;
          _store.changeSelectedExtract("5");
          _extractRepository.getAll("5").then(
            (data) {
              _store.setExtract(data);
              _store.busy = false;
            },
          );
          return;
        }
      case "15":
        {
          _store.busy = true;
          _store.changeSelectedExtract("15");
          _extractRepository.getAll("15").then(
            (data) {
              _store.setExtract(data);
              _store.busy = false;
            },
          );
          return;
        }
      case "30":
        {
          _store.busy = true;
          _store.changeSelectedExtract("30");
          _extractRepository.getAll("30").then(
            (data) {
              _store.setExtract(data);
              _store.busy = false;
            },
          );
          return;
        }
      case "60":
        {
          _store.busy = true;
          _store.changeSelectedExtract("60");
          _extractRepository.getAll("60").then(
            (data) {
              _store.setExtract(data);
              _store.busy = false;
            },
          );
          return;
        }
      case "90":
        {
          _store.busy = true;
          _store.changeSelectedExtract("90");
          _extractRepository.getAll("90").then(
            (data) {
              _store.setExtract(data);
              _store.busy = false;
            },
          );
          return;
        }
    }
  }

 
