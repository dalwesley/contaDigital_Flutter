import 'package:flutter/material.dart';
import 'package:card/controllers/app.controller.dart';
import 'package:card/store/app.store.dart';
import 'package:card/ui/shered/componets/extract/extract-list.widget.dart';
import 'package:card/ui/shered/componets/extract/extract-navbar.widget.dart';
import 'package:provider/provider.dart';
import 'package:card/ui/shered/componets/extract/credit.card.widget.dart';

class HomeExtratoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new AppController(store);

    // Só ocorre na primeira vez que o App rodar
    // if (store.clienteState == "none") {
    // controller.changeSelection("5");
    // cardController.changeCardDetails(Settings.cardNumber);
    // }
    return Container(
      // backgroundColor: backgroundColor,
      child: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black26,
                          offset: new Offset(1, 2.0),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/seta_card.png",
                                width: constraints.maxWidth * 0.08,
                              ),
                              Text(
                                " Meu cartão ",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Image.asset(
                                "assets/images/seta_card.png",
                                width: constraints.maxWidth * 0.08,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Tudo sobre seu cartão está aqui",
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.center,
                        ),
                        CreditCard(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ExtractNavbar(),
                        ),
                        ExtractList()
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
