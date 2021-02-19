import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:card/blocs/card.bloc.dart';
import 'package:card/blocs/user.bloc.dart';
import 'package:card/settings.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/android/views/home.term.dart';
import 'package:card/ui/android/views/home.view.dart';
import 'package:card/ui/android/views/help.view.dart';
import 'package:card/ui/android/views/login.view.dart';
import 'package:card/ui/shered/componets/button.widget.dart';
import 'package:card/ui/shered/progress-indicator.widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:card/ui/android/views/home-update.password.view.dart';

class LoginViewPassword extends StatefulWidget {
  final cardNumber;
  LoginViewPassword({@required this.cardNumber});

  @override
  _LoginViewPasswordState createState() => _LoginViewPasswordState();
}

class _LoginViewPasswordState extends State<LoginViewPassword> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  var busy = false;
  var cardDefaultPassword;
  var cardStatus;
  var term;
  String cardValue;
  bool boolValue;
  bool _passwordVisible;
  var userBloc = new UserBloc();
  var cardBloc = new CardBloc();

  TextEditingController controllerCardNumber = TextEditingController();
  TextEditingController controllerCardPassword = TextEditingController();

  var cardTextInputFormatter =
      MaskTextInputFormatter(mask: "####-####-####-####");

  @override
  void initState() {
    _passwordVisible = false;
    getValuesSF();
    super.initState();
  }

  //------------------------------------------------ validação do cartão
  handleValidation(cardNumber) {
    setState(() {
      busy = true;
    });

    userBloc.status(cardNumber).then((data) {
      cardDefaultPassword = data.cardDefaultPassword;
      cardStatus = data.cardStatus;
      term = data.termoLGPD;
      if (data.cardStatus == 'NOT_FOUND') {
        var snackbar = new SnackBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: textColor,
          content: new Text(
            "Cartão não encontrado!",
          ),
        );
        _scaffoldKey.currentState.showSnackBar(snackbar);
        return;
      } else if (data.cardDefaultPassword == 'S') {
        updatePassword(cardNumber);
        // } else if (data.termoLGPD == 'N') {
        //   acceptTerm();
      } else if (data.cardDefaultPassword == 'N') {
        return;
      } else {
        onError();
      }
    }).catchError((err) {
      onError();
    }).whenComplete(() {
      onComplete();
    });
  }

  //------------------------------------------------ validação da senha
  authenticate(cardNumber, cardPassword) async {
    var cardAuthenticate =
        await userBloc.authenticate(cardNumber, cardPassword);
    if (cardAuthenticate.idReturn == 0) {
      onSuccess();
    } else if (cardAuthenticate.idReturn == 1) {
      final snackBar = SnackBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        backgroundColor: textColor,
        content: Text(
          'Usuário ou senha invalidos',
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    } else if (cardAuthenticate.idReturn == 2) {
      final snackBar = SnackBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        backgroundColor: textColor,
        content: Text(
          'Não te encontramos! Os dados estão corretos?!',
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    } else if (cardAuthenticate == null) {
      final snackBar = SnackBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        backgroundColor: textColor,
        content: Text(
          'Opsss... Alguma coisa deu errado!',
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

//------------------------------------------------ Pega dados do usuario
  handleUserDetails(cardNumber) {
    setState(() {
      busy = true;
    });

    userBloc.details(cardNumber).then((datas) {
      final UserBloc bloc = new UserBloc();
      Settings.userModel.userName = datas.userName;
      // cardStatus = data.cardStatus;
      // if (data.cardStatus == 'NOT_FOUND') {
      //   var snackbar =
      //       new SnackBar(content: new Text("Cartão não encontrado!"));
      //   _scaffoldKey.currentState.showSnackBar(snackbar);
      //   return;
      // } else if (data.cardDefaultPassword == 'N') {
      //   return;
      // } else if (data.cardDefaultPassword == 'S') {
      //   updatePassword(cardNumber);
      // } else {
      //   onError();
      // }
    }).catchError((err) {
      onError();
    }).whenComplete(() {
      onComplete();
    });
  }

  //------------------------------------------------ Pega dados do Cartao
  handleCardDetails(cardNumber) {
    setState(() {
      busy = true;
    });

    cardBloc.details(cardNumber).then((data) {
      // cardDefaultPassword = data.cardDefaultPassword;
      // cardStatus = data.cardStatus;
      // if (data.cardStatus == 'NOT_FOUND') {
      //   var snackbar =
      //       new SnackBar(content: new Text("Cartão não encontrado!"));
      //   _scaffoldKey.currentState.showSnackBar(snackbar);
      //   return;
      // } else if (data.cardDefaultPassword == 'N') {
      //   return;
      // } else if (data.cardDefaultPassword == 'S') {
      //   updatePassword(cardNumber);
      // } else {
      //   onError();
      // }
    }).catchError((err) {
      onError();
    }).whenComplete(() {
      onComplete();
    });
  }

  updatePassword(cardNumber) {
    handleUserDetails(controllerCardNumber.text);
    handleCardDetails(controllerCardNumber.text);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeUpdatePassword(cardNumber: cardNumber),
      ),
    );
  }

  onSuccess() {
    handleUserDetails(controllerCardNumber.text);
    handleCardDetails(controllerCardNumber.text);
    if (term == 'N') {
      acceptTerm();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      );
    }
  }

  acceptTerm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeTermView(
          comingFrom: 'inicio',
        ),
      ),
    );
  }

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

  onComplete() {
    setState(() {
      busy = false;
    });
  }

  saveCardNumber(numberCard) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', numberCard);
  }

  saveCheck(boolValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', boolValue);
  }

  getValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    cardValue = prefs.getString('stringValue');
    controllerCardNumber = new TextEditingController(text: cardValue);
    //Return bool
    boolValue = prefs.getBool('boolValue');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   stops: [0.3, 9],
              //   colors: [Colors.blue[900], primaryColor],
              // ),
              ),
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
                          //--------------------------------------------------------container do logo
                          Container(
                            // color: Colors.red,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/images/logocard_bco.png",
                                  width: constraints.maxWidth * 0.6,
                                  height: constraints.maxHeight * 0.3,
                                ),
                              ],
                            ),
                          ),
                          //----------------------------------------------------------------- container dos form
                          Container(
                            // color: Colors.yellow,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight / 3,
                            child: Form(
                              key: _formKey,
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Você está logando com o cartão:",
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * 0.03,
                                          fontWeight: FontWeight.w600,
                                          color: backgroundColor),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      widget.cardNumber,
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * 0.05,
                                          fontWeight: FontWeight.w600,
                                          color: backgroundColor),
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      maxLength: 4,
                                      obscureText: !_passwordVisible,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      textInputAction: TextInputAction.go,
                                      decoration: InputDecoration(
                                        hintText:
                                            "Digite a senha do Plantão Card",
                                        hintStyle: TextStyle(
                                            fontSize: 15.0,
                                            color: backgroundColor),
                                        suffixIcon: GestureDetector(
                                          onLongPress: () {
                                            setState(() {
                                              _passwordVisible = true;
                                            });
                                          },
                                          onLongPressUp: () {
                                            setState(() {
                                              _passwordVisible = false;
                                            });
                                          },
                                          child: Icon(
                                              _passwordVisible
                                                  ? FontAwesomeIcons.eye
                                                  : FontAwesomeIcons.eyeSlash,
                                              color: backgroundColor),
                                        ),
                                      ),
                                      controller: controllerCardPassword,
                                      validator: validarPassword,
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * 0.05,
                                          fontWeight: FontWeight.w600,
                                          color: backgroundColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //------------------------------------------------------- container do button
                          Container(
                            // color: Colors.amber,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                busy == false
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: acceptColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                          width: constraints.maxWidth * 0.7,
                                          // image: "assets/images/pc.png",
                                          text: "Entrar na conta",

                                          callback: () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              _formKey.currentState.save();
                                              handleValidation(
                                                  controllerCardNumber.text);
                                              authenticate(
                                                controllerCardNumber.text,
                                                controllerCardPassword.text,
                                              );
                                            } else {
                                              onError();
                                            }
                                          },
                                        ),
                                      )
                                    : GenericProgressIndicator(),
                                Container(
                                  decoration: BoxDecoration(
                                    color: textColor,
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
                                    width: constraints.maxWidth * 0.7,
                                    // image: "assets/images/pc.png",
                                    text: "Entrar na com outra conta",

                                    callback: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginView(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  child: FlatButton(
                                    onPressed: site,
                                    child: Image.asset(
                                      "assets/images/card_bco.png",
                                      width: constraints.maxHeight * 0.1,
                                      height: constraints.maxHeight * 0.1,
                                    ),
                                  ),
                                ),
                              ],
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

  help() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HelpView(),
      ),
    );
  }

  site() async {
    const url = 'https://card.com.br/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String validarCartao(String value) {
    String patttern = r'(^[0-9+\-]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return "Por favor, informe o número do cartão";
    } else if (value.length != 19) {
      return "O cartão deve ter 16 números!";
      // }
      // else if (!regExp.hasMatch(value)) {
      //   return "Opss, deu algo errado! O número do Cartão so deve conter dígitos!'";
    }
    return null;
  }

  String validarPassword(String value) {
    String patttern = r'(^[0-9+\-]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return "Por favor, informe a senha do cartão";
    } else if (value.length != 4) {
      return "A senha deve ter 4 números!";
      // }
      // else if (!regExp.hasMatch(value)) {
      //   return "Opss, deu algo errado! O número do Cartão so deve conter dígitos!'";
    }
    return null;
  }
}
