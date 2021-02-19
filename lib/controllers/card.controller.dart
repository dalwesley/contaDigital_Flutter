import 'package:card/repositories/card.details.repository.dart';
import 'package:card/settings.dart';
import 'package:card/store/card.store.dart';

class CardController {
  final number = Settings.cardNumber;

  CardStore _cardStore;
  CardDetailsRepository _cardRepository;

  CardController(CardStore cardStore) {
    _cardStore = cardStore;
    _cardRepository = new CardDetailsRepository();
  }

  void changeSelection(String selection) {
    _cardStore.clearCardDetails();
    if ((selection == Settings.cardNumber)) {
      _cardStore.busy = true;
      _cardStore.changeSelectedCardDetails(selection);
      _cardRepository.getCardDetails(Settings.cardNumber).then(
        (data) {
          // _cardStore.setCardDetails();
          _cardStore.busy = false;
        },
      );
      return;
    } else {
      _cardStore.busy = true;
      _cardStore.changeSelectedCardDetails(selection);
      _cardRepository.getCardDetails(Settings.cardNumber).then(
        (data) {
          // _cardStore.setCardDetails(data);
          _cardStore.busy = false;
        },
      );
      return;
    }
  }
}
