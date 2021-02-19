import 'package:flutter/material.dart';
import 'package:card/settings.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/shered/componets/user/user.list.widget.dart';

class HomeUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
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
                    "Mantenha seus dados atualizados para receber nossas promoções e beneficios",
                    style: Theme.of(context).textTheme.subtitle2,
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: UserList(user: Settings.userModel),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
