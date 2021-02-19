import 'package:flutter/material.dart';
import 'package:card/models/notification.model.dart';

class EstabilishmentDetails extends StatelessWidget {
  final NotificationModel item;

  EstabilishmentDetails({@required this.item});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
                    Text(" Detalhes ",
                        style: Theme.of(context).textTheme.subtitle1),
                    Image.asset(
                      "assets/images/seta_card.png",
                      width: constraints.maxWidth * 0.08,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: new Text(item.titulo,
                          style: Theme.of(context).textTheme.bodyText2),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(item.texto,
                          style: Theme.of(context).textTheme.subtitle2),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }

  // abrirWhatsApp() async {
  //   var whatsappUrl = item.phoneNumber;

  //   if (await canLaunch(whatsappUrl)) {
  //     await launch(whatsappUrl);
  //   } else {
  //     throw 'Could not launch $whatsappUrl';
  //   }
  // }
}
