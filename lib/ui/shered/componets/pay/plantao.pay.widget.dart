import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:card/themes/light.theme.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../button.widget.dart';

class Pay extends StatelessWidget {
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
    TextEditingController _keyPixController;
    TextEditingController _saleCardNumberController;
    TextEditingController _saleValueController;
    TextEditingController _salePortionController;
    TextEditingController _salePasswordController;

    // var cpfTextInputFormatter = MaskTextInputFormatter(mask: "###.###.###-##");

    FocusNode focusKeyPix = FocusNode();
    FocusNode focusSaleCardNumber = FocusNode();
    FocusNode focusSaleValue = FocusNode();
    FocusNode focusSalePortion = FocusNode();
    FocusNode focusSalePassword = FocusNode();

    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          width: size.width,
          height: size.height * 0.50,
          child: Expanded(
            child: Container(
              child: LayoutBuilder(
                builder: (_, constraints) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //------------------------------------------------------------------ form cod estabelecimento (KeyPix)
                        TextFormField(
                          keyboardType: TextInputType.number,
                          // inputFormatters: [birthDateTextInputFormatter],
                          obscureText: false,
                          focusNode: focusKeyPix,
                          // textAlign: TextAlign.center,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.ac_unit_outlined),
                            labelText: 'Código do estabelecimento',
                            hintText: "Digite o código do estabelecimento",
                          ),
                          controller: _keyPixController,
                          validator: keyPixvalidator,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                          onFieldSubmitted: (term) {
                            focusKeyPix.unfocus();
                            FocusScope.of(context).requestFocus(focusSaleValue);
                          },
                        ),

                        //------------------------------------------------------------------ form valor (SaleValue)
                        TextFormField(
                          keyboardType: TextInputType.number,
                          // inputFormatters: [birthDateTextInputFormatter],
                          obscureText: false,
                          focusNode: focusSaleValue,
                          // textAlign: TextAlign.center,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.ac_unit_outlined),
                            labelText: 'Valor',
                            hintText: "Digite o valor a ser pago",
                            hintStyle: TextStyle(
                              fontSize: constraints.maxWidth * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          controller: _keyPixController,
                          // validator: validarBirthDate,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                          onFieldSubmitted: (term) {
                            focusKeyPix.unfocus();
                            FocusScope.of(context).requestFocus(focusSaleValue);
                          },
                        ),

//------------------------------------------------------------------ form parcela (_salePortion)
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Número de parcelas',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Colors.grey.shade600),
                                ),
                                SizedBox(height: 5),
                                RatingBar.builder(
                                  initialRating: 1,
                                  itemCount: 7,
                                  itemBuilder: (context, index) {
                                    switch (index) {
                                      case 0:
                                        return Text("0",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6);
                                      // Icon(
                                      //   Icons.exposure_zero,
                                      //   color: Colors.red,
                                      // );
                                      case 1:
                                        return Text("1",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6);
                                      case 2:
                                        return Text("2",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6);
                                      case 3:
                                        return Text("3",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6);
                                      case 4:
                                        return Text("4",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6);
                                      case 5:
                                        return Text("5",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6);
                                      case 6:
                                        return Text("6",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6);
                                    }
                                  },
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),

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
                                showAlert(context);
                              } else {
                                onError();
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String keyPixvalidator(String value) {
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
