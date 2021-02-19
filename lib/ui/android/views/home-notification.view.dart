import 'package:flutter/material.dart';
import 'package:card/blocs/notification.bloc.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/shered/componets/notification/notification.list.widget.dart';
import 'package:provider/provider.dart';

class HomeNotificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NotificationBloc bloc = Provider.of<NotificationBloc>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: size.width,
        height: size.height,
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          Text(
                            " Notificações ",
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
                        "Pormoções, informações e avisos! Fique ligado aqui que terá promoções",
                        style: Theme.of(context).textTheme.subtitle2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                        child:
                            NotificationList(notification: bloc.notification)),
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
