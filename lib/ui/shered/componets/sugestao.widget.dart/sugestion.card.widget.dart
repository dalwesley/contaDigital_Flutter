import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:card/settings.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/shered/componets/button.widget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SugestionCard extends StatelessWidget {
  var date = new DateTime.now();
  final _dateFormat = new DateFormat('dd/MM/yyyy');

  String optionSugestion;
  String textSugestion;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();

  onError() {
    var snackbar = new SnackBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      backgroundColor: textColor,
      content: new Text(
        "Alguma coisa deu errado!",
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  showAlert(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Mensagem enviada",
      style: AlertStyle(
        titleStyle: Theme.of(context).textTheme.bodyText2,
        descStyle: Theme.of(context).textTheme.headline4,
      ),
      desc: "Fique ligado no seu email;\n te responderemos por lá!",
      buttons: [
        DialogButton(
          color: acceptColor,
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: LayoutBuilder(
                    builder: (_, constraints) {
                      return Column(
                        children: [
                          //--------------------------------------------------------container do 1
                          Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: DropdownButtonFormField(
                                    // iconSize: 50,
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 20,
                                    ),
                                    hint: Text('Selecione uma opção'),
                                    items: [
                                      DropdownMenuItem(
                                          value: 'Dúvidas',
                                          child: Text('Dúvidas')),
                                      DropdownMenuItem(
                                          value: 'Sugestão',
                                          child: Text('Sugestão')),
                                      DropdownMenuItem(
                                          value: 'Crítica',
                                          child: Text('Crítica')),
                                      DropdownMenuItem(
                                          value: 'Outros',
                                          child: Text('Outros')),
                                    ],
                                    onChanged: (value) {
                                      optionSugestion = value;
                                    },
                                    validator: validarOptionSugestion,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //--------------------------------------------------------container do 2
                          Container(
                            width: constraints.maxWidth,
                            // height: constraints.maxHeight / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    maxLines: 10,
                                    // inputFormatters: [
                                    //   variableBloc.cardTextInputFormatter
                                    // ],
                                    textInputAction: TextInputAction.go,
                                    // maxLength: 19,
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      hintText: "Digite sua mensagem",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize: 20.0, color: textColor),
                                    ),
                                    onChanged: (value) {
                                      textSugestion = value;
                                    },
                                    validator: validarTextSugestion,
                                    // style: TextStyle(
                                    //     fontSize: constraints.maxWidth * 0.05,
                                    //     fontWeight: FontWeight.w600,
                                    //     color: textColor),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //------------------------------------------------------- container do button
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 30.0),
                            child: Container(
                              // color: Colors.amber,
                              // width: constraints.maxWidth,
                              // height: constraints.maxHeight / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
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
                                    // height: 50,
                                    child: TDButton(
                                      text: 'Enviar',
                                      callback: () {
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                          sendEmail();
                                          showAlert(context);
                                        } else {
                                          onError();
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
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

  //-----------------------------------------------------------email---------------------------------------------------
  void sendEmail() async {
    await Settings.email.sendMessage(
        'O Sr(a). ' +
            Settings.cardDetails.holderName +
            ' enviou uma mensagem com o titúlo: ' +
            optionSugestion +
            '.'
                //--------------------------dados do usuario
                '\n\n\nDados do usúario:\n'
                '\nNome: ' +
            Settings.cardDetails.holderName +
            '\nEmpresa: ' +
            Settings.cardDetails.businessName +
            '\nCelular: ' +
            Settings.userModel.userPhone +
            '\nEmail: ' +
            Settings.userModel.userEmail +
            '\nCidade: ' +
            Settings.userModel.userCity +
            '\nBairro: ' +
            Settings.userModel.userDistrict +
            //--------------------------dados da mensagem
            '\n\n\nDados da mensagem: \n'
                //     '\nData: ' +
                // _dateFormat.toString() +
                '\nTipo de Mensagem: ' +
            optionSugestion +
            '\nMensagem: ' +
            textSugestion +
            // '\nCEP: ' +
            // _cepControlller.text +

            //----------------------------- rodapé
            '\n\n\nO conteúdo deste e-mail é confidencial e destinado exclusivamente ao destinatário especificado apenas na mensagem.' +
            '\nÉ estritamente proibido compartilhar qualquer parte desta mensagem com terceiros, sem o consentimento por escrito do remetente ou do repesentante legal da empresa.' +
            '\nSe você recebeu esta mensagem por engano, responda a esta mensagem e siga com sua exclusão, para que possamos garantir que tal erro não ocorra no futuro.\n',
        //----------------------------------email de destinatario
        _emailController,

        //---------------------------------assunto
        optionSugestion + ' de ' + Settings.cardDetails.holderName);
    // });
  }
}

String validarOptionSugestion(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value == null) return "Por favor, selecione uma opção!";

  return null;
}

String validarTextSugestion(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value == "") return "Por favor, digite seu texto!";

  return null;
}
