import 'package:mobx/mobx.dart';
import 'package:card/models/cardDetails.model.dart';
import 'package:card/settings.dart';
part 'card.store.g.dart';

class CardStore = _CardStore with _$CardStore;

abstract class _CardStore with Store {
  @observable
  String cardDetailsState = Settings.cardNumber;
  @observable
  bool busy = false;

  @observable
  ObservableList<CardDetailsModel> cardDetails =
      new ObservableList<CardDetailsModel>();

  @action
  void changeSelectedCardDetails(String state) {
    cardDetailsState = state;
  }

  @action
  void addCardDetails(CardDetailsModel item) {
    cardDetails.add(item);
  }

  @action
  void setCardDetails(List<CardDetailsModel> items) {
    cardDetails.addAll(items);
  }

  @action
  void clearCardDetails() {
    cardDetails = new ObservableList<CardDetailsModel>();
  }
}
