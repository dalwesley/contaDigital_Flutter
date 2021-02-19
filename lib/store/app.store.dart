import 'package:mobx/mobx.dart';
import 'package:card/models/extract.model.dart';
part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  String extractState = "0";
  @observable
  bool busy = false;

  @observable
  ObservableList<ExtractModel> extract = new ObservableList<ExtractModel>();

  @action
  void changeSelectedExtract(String state) {
    extractState = state;
  }

  @action
  void addExtract(ExtractModel item) {
    extract.add(item);
  }

  @action
  void setExtract(List<ExtractModel> items) {
    extract.addAll(items);
  }

  @action
  void clearExtract() {
    extract = new ObservableList<ExtractModel>();
  }
}
