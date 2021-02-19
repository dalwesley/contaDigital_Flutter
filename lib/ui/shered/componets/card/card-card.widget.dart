import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:card/themes/light.theme.dart';
import '../../../../settings.dart';

class CardCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Settings.cardDetails.status == 'S'
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Cartão Liberado",
                          style: Theme.of(context).textTheme.headline4),
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 15,
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cartão Bloqueado",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Icon(
                        Icons.remove_circle_outline,
                        color: Colors.red,
                        size: 15,
                      ),
                    ],
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    LinearPercentIndicator(
                      width: 100.0,
                      lineHeight: 8.0,
                      percent: 1.0,
                      progressColor: acceptColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Disponível: " + Settings.cardDetails.availableBalance,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    LinearPercentIndicator(
                      width: 100.0,
                      lineHeight: 8.0,
                      percent: 1.0,
                      progressColor: Colors.red.shade100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Total: " + Settings.cardDetails.totalBalance,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    LinearPercentIndicator(
                      width: 100.0,
                      lineHeight: 8.0,
                      percent: 1.0,
                      progressColor: Colors.blue.shade100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Utilizado: " + Settings.cardDetails.usedBalance,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Melhor dia para comprar: " +
                          Settings.cardDetails.bestPurchaseDate,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Fechamento: " + Settings.cardDetails.closeDate,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
