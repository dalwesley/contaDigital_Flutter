import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:card/blocs/user.bloc.dart';
import 'package:card/models/user.model.dart';
import 'package:card/themes/light.theme.dart';

import '../../../../settings.dart';
import '../button.widget.dart';
import 'home.user.editor.view.dart';

class UserList extends StatelessWidget {
  final UserBloc bloc = new UserBloc();
  final UserModel user;

  UserList({@required this.user});

  @override
  Widget build(BuildContext context) {
    DateTime data = DateTime.now();
    var size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Dados Pessoais',
                            style: new TextStyle(
                              fontSize: constraints.maxWidth * 0.04,
                              fontWeight: FontWeight.w700,
                              color: primaryColor,
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FaIcon(FontAwesomeIcons.user),
                                  ),
                                  Text(
                                    user.userName ?? " - ",
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FaIcon(FontAwesomeIcons.idCard)),
                              Text(
                                Settings.userModel.userCpf ?? " - ",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FaIcon(FontAwesomeIcons.at)),
                              Text(
                                Settings.userModel.userEmail ?? " - ",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Settings.userModel.userSexo == 'F'
                                      ? FaIcon(FontAwesomeIcons.venus)
                                      : Settings.userModel.userSexo == 'M'
                                          ? FaIcon(FontAwesomeIcons.mars)
                                          : FaIcon(FontAwesomeIcons.venusMars)),
                              Text(
                                Settings.userModel.userSexo ?? " - ",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FaIcon(FontAwesomeIcons.mobileAlt)),
                              Text(
                                Settings.userModel.userPhone ?? " - ",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Settings.userModel.userBirthDate !=
                                          DateFormat("dd/MM/yyyy")
                                              .format(data)
                                              .toString()
                                      ? FaIcon(FontAwesomeIcons.birthdayCake)
                                      : Text("🎁")),
                              Text(
                                Settings.userModel.userBirthDate ?? " - ",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Endereço',
                            style: new TextStyle(
                              fontSize: constraints.maxWidth * 0.04,
                              fontWeight: FontWeight.w700,
                              color: primaryColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FaIcon(FontAwesomeIcons.road)),
                              Text(
                                Settings.userModel.userAddress ?? " - ",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      FaIcon(FontAwesomeIcons.sortNumericDown)),
                              Text(
                                Settings.userModel.userNumber ?? " - ",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FaIcon(
                                      FontAwesomeIcons.exclamationCircle)),
                              Text(
                                Settings.userModel.userComplement ?? " - ",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FaIcon(FontAwesomeIcons.mapMarkerAlt)),
                              Text(
                                Settings.userModel.userDistrict ?? " - ",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FaIcon(FontAwesomeIcons.mapPin)),
                              Text(
                                Settings.userModel.userCep ?? " - ",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FaIcon(FontAwesomeIcons.city)),
                              Text(
                                Settings.userModel.userCity ?? " - ",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      FaIcon(FontAwesomeIcons.globeAmericas)),
                              Text(
                                Settings.userModel.userState ?? " - ",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: acceptColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.black26,
                              offset: new Offset(1, 2.0),
                              blurRadius: 3,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: TDButton(
                          text: "Editar",
                          callback: () =>
                              navegarParaEditor(context, Settings.userModel),
                        ),
                      ),
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

  void navegarParaEditor(context, usuario) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeUserEditor(userModel: usuario),
      ),
    );
  }
}
