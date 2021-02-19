import 'package:flutter/material.dart';
import 'package:card/ui/shered/componets/top.components.dart';
import 'package:card/ui/shered/componets/term/term.list.widget.dart';

class HomeTermView extends StatelessWidget {
  HomeTermView({Key key, @required this.comingFrom}) : super(key: key);
  final comingFrom;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              TopComponents(),
              Expanded(
                child: Container(
                  child: LayoutBuilder(
                    builder: (_, constraints) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/seta_card.png",
                                  width: constraints.maxWidth * 0.08,
                                ),
                                Text(
                                  " Nossos termos ",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                Image.asset(
                                  "assets/images/seta_card.png",
                                  width: constraints.maxWidth * 0.08,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Leia nosso temo de uso e a Lei Geral de Proteção de Dados",
                              style: Theme.of(context).textTheme.subtitle2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: TermList(comingFrom: 'password'),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
