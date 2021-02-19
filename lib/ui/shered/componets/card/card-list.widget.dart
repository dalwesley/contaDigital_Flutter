import 'package:flutter/material.dart';
import 'package:card/models/cardDetails.model.dart';
import 'package:card/ui/shered/componets/card/card-card.widget.dart';

class CardList extends StatelessWidget {
  final CardDetailsModel cardDetailsModel;

  CardList({@required this.cardDetailsModel});

  @override
  Widget build(BuildContext context) {
    return CardCard();
  }
}
