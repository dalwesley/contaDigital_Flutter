import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:card/controllers/app.controller.dart';
import 'package:card/repositories/card.details.repository.dart';
import 'package:card/store/app.store.dart';
import 'package:provider/provider.dart';
import '../../../../themes/light.theme.dart';

class ExtractNavbar extends StatelessWidget {
  final CardDetailsRepository httpService = CardDetailsRepository();
  // final ExtractModel item;

  // ExtractNavbar({@required this.item});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new AppController(store);
    return Container(
      color: backgroundColor,
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Observer(
            builder: (_) => FlatButton(
              // color: store.extractState == "5" ? Colors.white : backgroundColor,
              child: Container(
                child: Text("5 dias",
                    style: store.extractState == "5"
                        ? Theme.of(context).textTheme.headline5
                        : Theme.of(context).textTheme.headline4),
              ),
              onPressed: () {
                controller.changeSelection("5");
              },
            ),
          ),
          Observer(
            builder: (_) => FlatButton(
              // color:
              //     store.extractState == "15" ? Colors.white : backgroundColor,
              child: Container(
                child: Text("15 dias",
                    style: store.extractState == "15"
                        ? Theme.of(context).textTheme.headline5
                        : Theme.of(context).textTheme.headline4),
              ),
              onPressed: () {
                controller.changeSelection("15");
              },
            ),
          ),
          Observer(
            builder: (_) => FlatButton(
              // color:
              //     store.extractState == "30" ? Colors.white : backgroundColor,
              child: Container(
                child: Text("30 dias",
                    style: store.extractState == "30"
                        ? Theme.of(context).textTheme.headline5
                        : Theme.of(context).textTheme.headline4),
              ),
              onPressed: () {
                controller.changeSelection("30");
              },
            ),
          ),
          Observer(
            builder: (_) => FlatButton(
              // color:
              //     store.extractState == "60" ? Colors.white : backgroundColor,
              child: Container(
                child: Text("60 dias",
                    style: store.extractState == "60"
                        ? Theme.of(context).textTheme.headline5
                        : Theme.of(context).textTheme.headline4),
              ),
              onPressed: () {
                controller.changeSelection("60");
              },
            ),
          ),
          Observer(
            builder: (_) => FlatButton(
              // color:
              //     store.extractState == "90" ? Colors.white : backgroundColor,
              child: Container(
                child: Text("90 dias",
                    style: store.extractState == "90"
                        ? Theme.of(context).textTheme.headline5
                        : Theme.of(context).textTheme.headline4),
              ),
              onPressed: () {
                controller.changeSelection("90");
              },
            ),
          ),
        ],
      ),
    );
  }
}
