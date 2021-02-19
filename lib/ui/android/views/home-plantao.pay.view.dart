import 'package:flutter/material.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/shered/componets/pay/card.pay.widget.dart';

class HomecardPayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
                  child: ListView(
                    scrollDirection: Axis.vertical,
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
                              " Plantão",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              "Pay ",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Image.asset(
                              "assets/images/seta_card.png",
                              width: constraints.maxWidth * 0.08,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 10.0),
                        child: Text(
                          "Por aqui você pode pagar suas comprar sem precisar do cartão",
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pay(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
