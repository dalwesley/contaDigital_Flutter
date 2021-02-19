import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:card/blocs/home.bloc.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/shered/componets/estabilishment/estabilishment-list.widget.dart';
import 'package:card/ui/shered/componets/top.components.dart';
import 'package:provider/provider.dart';

class HomeEstabilishmentView extends StatelessWidget {
  final category;

  HomeEstabilishmentView({@required this.category});

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: size.width,
        height: size.height,
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopComponents(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/seta_card.png",
                        width: constraints.maxWidth * 0.08,
                      ),
                      Text(
                        " Nossos Parceiros ",
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
                    "Selecione uma categoria para exibir os estabelecimentos onde você pode usar seu Plantão Card",
                    style: Theme.of(context).textTheme.subtitle2,
                    textAlign: TextAlign.center,
                  ),
                ),
                // TextFormField(
                //   keyboardType: TextInputType.text,
                //   textAlign: TextAlign.center,
                //   textInputAction: TextInputAction.go,
                //   // maxLength: 19,
                //   decoration: InputDecoration(
                //     hintText: "Pesquisar",
                //     hintStyle: TextStyle(fontSize: 20.0, color: textColor),
                //   ),
                //   // controller:
                //   //     variableBloc.controllerCardNumber,
                //   // validator: validarCartao,
                //   style: TextStyle(
                //       fontSize: 25,
                //       fontWeight: FontWeight.w600,
                //       color: primaryColor),
                // ),
                Expanded(
                  child: EstabilishmentList(
                    estabilishment: bloc.estabilishment,
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
