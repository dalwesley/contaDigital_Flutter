import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/shered/componets/card/card-card.widget.dart';

import '../../../../settings.dart';

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return ExpansionCard(
        initiallyExpanded: true,
        title: Row(
          children: <Widget>[
            //------------------------------------------- verifica e troca imagem do cartao
            Center(
              child:
                  // verifica se é DB - card
                  Settings.cardDetails.customAssetName == 'DB - card'
                      ? Image.asset(
                          "assets/images/card.png",
                          width: constraints.maxWidth * 0.08,
                        )
                      :
                      // verifica se é RPC - card Card
                      Settings.cardDetails.customAssetName == 'RPC - card Card'
                          ? Image.asset(
                              "assets/images/card.png",
                              width: constraints.maxWidth * 0.2,
                            )
                          : // verifica se é AL - Alimentação
                          Settings.cardDetails.customAssetName ==
                                  'AL - Alimentação'
                              ? Image.asset(
                                  "assets/images/alimentacao.png",
                                  width: constraints.maxWidth * 0.2,
                                )
                              : // verifica se é RF - Refeição
                              Settings.cardDetails.customAssetName ==
                                      'RF - Refeição'
                                  ? Image.asset(
                                      "assets/images/refeicao.png",
                                      width: constraints.maxWidth * 0.2,
                                    )
                                  : // verifica se é RPC - CARTÃO NATAL
                                  Settings.cardDetails.customAssetName ==
                                          'RPC - CARTÃO NATAL'
                                      ? Image.asset(
                                          "assets/images/natalino.png",
                                          width: constraints.maxWidth * 0.2,
                                        )
                                      : // verifica se é BE - BEM ESTAR
                                      Settings.cardDetails.customAssetName ==
                                              'BE - BEM ESTAR'
                                          ? Image.asset(
                                              "assets/images/bemEstar.png",
                                              width: constraints.maxWidth * 0.2,
                                            )
                                          : // verifica se é maxcard
                                          Settings.cardDetails
                                                      .customAssetName ==
                                                  'MXC - MAXCARD'
                                              ? Image.asset(
                                                  "assets/images/maxCard.png",
                                                  width: constraints.maxWidth *
                                                      0.25,
                                                )
                                              : // verifica se é CANTINEX
                                              Settings.cardDetails
                                                          .customAssetName ==
                                                      'CANTINEX'
                                                  ? Image.asset(
                                                      "assets/images/cantinex.png",
                                                      width:
                                                          constraints.maxWidth *
                                                              0.25,
                                                    )
                                                  : // verifica se é maxcard
                                                  Settings.cardDetails
                                                              .customAssetName ==
                                                          'RPC - COMBUSTIVEL '
                                                      ? Image.asset(
                                                          "assets/images/combustivel.png",
                                                          width: constraints
                                                                  .maxWidth *
                                                              0.2,
                                                        )
                                                      : // verifica se é maxcard
                                                      Settings.cardDetails
                                                                  .customAssetName ==
                                                              'null'
                                                          ? Image.asset(
                                                              "assets/images/card.png",
                                                              width: constraints
                                                                      .maxWidth *
                                                                  0.2,
                                                            )
                                                          : Text("-"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //-------------------------------------- verifica e troca o nome do cartao
                // Center(
                // child:
                // verifica se é DB - card
                Settings.cardDetails.customAssetName == 'DB - card'
                    ? Text(" Meu card",
                        style: Theme.of(context).textTheme.headline6)
                    :
                    // verifica se é RPC - card Card
                    Settings.cardDetails.customAssetName == 'RPC - card Card'
                        ? Text(" Meu card Card",
                            style: Theme.of(context).textTheme.headline6)
                        : // verifica se é AL - Alimentação
                        Settings.cardDetails.customAssetName ==
                                'AL - Alimentação'
                            ? Text(" Meu Alimentação",
                                style: Theme.of(context).textTheme.headline6)
                            : // verifica se é RF - Refeição
                            Settings.cardDetails.customAssetName ==
                                    'RF - Refeição'
                                ? Text(" Meu Refeição",
                                    style:
                                        Theme.of(context).textTheme.headline6)
                                : // verifica se é RPC - CARTÃO NATAL
                                Settings.cardDetails.customAssetName ==
                                        'RPC - CARTÃO NATAL'
                                    ? Text(" Meu Cartão Natal",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6)
                                    : // verifica se é BE - BEM ESTAR
                                    Settings.cardDetails.customAssetName ==
                                            'BE - BEM ESTAR'
                                        ? Text(" Meu Bem Estar",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6)
                                        : // verifica se é maxcard
                                        Settings.cardDetails.customAssetName ==
                                                'MXC - MAXCARD'
                                            ? Text(" Meu MaxCard",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6)
                                            : // verifica se é CANTINEX
                                            Settings.cardDetails.customAssetName ==
                                                    'CANTINEX'
                                                ? Text(" Meu Cantinex",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6)
                                                : // verifica se é maxcard
                                                Settings.cardDetails
                                                            .customAssetName ==
                                                        'RPC - COMBUSTIVEL '
                                                    ? Text(" Meu Combustível",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6)
                                                    : // verifica se é maxcard
                                                    Settings.cardDetails
                                                                .customAssetName ==
                                                            'null'
                                                        ? Text(" Meu Plantão Card",
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .headline6)
                                                        : Text(" -",
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .headline6),
                // ),
                Text(
                  " " + Settings.cardNumber,
                  style: TextStyle(
                      fontFamily: "Bahnschrift",
                      fontSize: constraints.maxWidth * 0.049,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              ],
            ),
          ],
        ),
        children: <Widget>[
          CardCard(),
        ],
      );
    });
  }
}
