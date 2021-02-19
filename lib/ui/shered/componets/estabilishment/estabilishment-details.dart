import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:card/blocs/home.bloc.dart';
import 'package:card/models/estabilishment.model.dart';
import 'package:card/themes/light.theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class EstabilishmentDetails extends StatelessWidget {
  final EstabilishmentModel item;

  EstabilishmentDetails({@required this.item});
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);
    return LayoutBuilder(
      builder: (_, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(" " + item.businessName + " ",
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                  ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: new Text('Dados do Estabelecimento',
                          style: Theme.of(context).textTheme.headline4)),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(FontAwesomeIcons.road),
                      ),
                      Text(item.publicPlace + ", ",
                          style: Theme.of(context).textTheme.headline3),
                      Text(item.number,
                          style: Theme.of(context).textTheme.headline3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(FontAwesomeIcons.mapMarkerAlt),
                      ),
                      Text(item.neighborhood,
                          style: Theme.of(context).textTheme.headline3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(FontAwesomeIcons.compass),
                      ),
                      Text(item.city,
                          style: Theme.of(context).textTheme.headline3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(FontAwesomeIcons.locationArrow),
                      ),
                      Text(item.state,
                          style: Theme.of(context).textTheme.headline3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(FontAwesomeIcons.sortNumericDown),
                      ),
                      Text(item.postalCode,
                          style: Theme.of(context).textTheme.headline3),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              color: backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // FlatButton(
                  //   // onLongPress: () {
                  //   //   controller.remove(widget.clienteModel);
                  //   //   Navigator.of(context).pop();
                  //   // },
                  //   onPressed: () {
                  //     // showAlertDialog();
                  //   },
                  //   color: Theme.of(context).primaryColor,
                  //   shape: CircleBorder(
                  //     side: BorderSide.none,
                  //   ),
                  //   child: Icon(
                  //     Icons.delete_forever,
                  //     color: Colors.red,
                  //     // size: constraints.maxWidth * 0.06,
                  //   ),
                  // ),
                  FlatButton(
                    onPressed: () {
                      launch("tel://${item.phoneNumber}");
                    },
                    color: Theme.of(context).primaryColor,
                    shape: CircleBorder(
                      side: BorderSide.none,
                    ),
                    child: Icon(
                      Icons.phone,
                      color: Colors.white,
                      // size: constraints.maxWidth * 0.05,
                    ),
                  ),
                  // FlatButton(
                  //   onPressed: () {
                  //     abrirWhatsApp();
                  //   },
                  //   color: Theme.of(context).primaryColor,
                  //   shape: CircleBorder(
                  //     side: BorderSide.none,
                  //   ),
                  //   child: Icon(
                  //     Icons.chat_bubble,
                  //     color: Colors.white,
                  //     // size: constraints.maxWidth * 0.05,
                  //   ),
                  // ),
                  // FlatButton(
                  //   // onPressed: () =>
                  //   // navegarParaClienteEditor(context, widget.clienteModel),
                  //   color: Theme.of(context).primaryColor,
                  //   shape: CircleBorder(
                  //     side: BorderSide.none,
                  //   ),
                  //   child: Icon(
                  //     Icons.edit,
                  //     color: Colors.white,
                  //     // size: constraints.maxWidth * 0.05,
                  //   ),
                  // ),
                ],
              ),
            )
          ],
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
