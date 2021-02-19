import 'package:flutter/material.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/shered/componets/sugestao.widget.dart/sugestion.card.widget.dart';

class HomeSugestionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: backgroundColor,
        width: size.width,
        height: size.height,
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Padding(
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
                            " Meus Dados ",
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
                      "Envia sua dúvida, crítica, elogio ou sugestão ",
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                      child: SugestionCard(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
