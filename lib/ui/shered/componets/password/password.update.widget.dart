import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:card/blocs/user.bloc.dart';
import 'package:card/ui/android/views/home.term.dart';
import 'package:card/models/password.model.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/android/views/home.view.dart';
import 'package:card/ui/shered/componets/button.widget.dart';

class PasswordUpdate extends StatefulWidget {
  // final UserModel userModel;
  // UserEditor({@required this.userModel});

  PasswordUpdate({Key key, @required this.cardNumber}) : super(key: key);
  final cardNumber;

  @override
  _PasswordUpdateState createState() => _PasswordUpdateState();
}

class _PasswordUpdateState extends State<PasswordUpdate> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  var userBloc = new UserBloc();
  var passwordModel = new PasswordModel();
  var busy = false;
  bool _value2 = false;
  String lgpd;
  FocusNode focusUserCpf = FocusNode();
  FocusNode focusUserOldCardpassword = FocusNode();
  FocusNode focusUserNewCardPassword = FocusNode();
  FocusNode focusUserNewCardPasswordConfirm = FocusNode();
  FocusNode focusUserCardCvv = FocusNode();
  FocusNode focusUserTermoLGPD = FocusNode();

  var cpfTextInputFormatter = MaskTextInputFormatter(mask: "###.###.###-##");

  @override
  final TextEditingController _controllerCPF = TextEditingController();
  final TextEditingController _controllerCardNewPassword =
      TextEditingController();
  final TextEditingController _controllerCardNewPasswordConfirm =
      TextEditingController();
  final TextEditingController _controllerCardOldPassword =
      TextEditingController();
  final TextEditingController _controllerCardCvv = TextEditingController();

  handlePassword(dados) async {
    userBloc.createPassword(dados).then((data) {
      if (data.idReturn == 200) {
        onSuccess();
      } else {
        final snackBar =
            SnackBar(content: Text('Opsss... Alguma coisa deu errado!'));
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    }).catchError((err) {
      onError();
    });
  }

  onSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(),
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: backgroundColor,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: LayoutBuilder(
                    builder: (_, constraints) {
                      return Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                children: [
                                  //------------------------------------------------------ Field CPF
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [cpfTextInputFormatter],
                                    obscureText: false,
                                    focusNode: focusUserCpf,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      labelText: 'Cpf',
                                      hintText: "Digite seu Cpf",
                                      hintStyle: TextStyle(
                                        fontSize: constraints.maxWidth * 0.04,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    controller: _controllerCPF,
                                    validator: validarCpf,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.04,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    onFieldSubmitted: (term) {
                                      focusUserCpf.unfocus();
                                      FocusScope.of(context).requestFocus(
                                          focusUserOldCardpassword);
                                    },
                                  ),

                                  //------------------------------------------------------ Field OldCardpassword
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    obscureText: true,
                                    focusNode: focusUserOldCardpassword,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      labelText: 'Senha Padrão',
                                      hintText: "Digite sua senha padrão",
                                      hintStyle: TextStyle(
                                        fontSize: constraints.maxWidth * 0.04,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    controller: _controllerCardOldPassword,
                                    validator: validarOldPassword,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.04,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    onFieldSubmitted: (term) {
                                      focusUserOldCardpassword.unfocus();
                                      FocusScope.of(context).requestFocus(
                                          focusUserNewCardPassword);
                                    },
                                  ),

                                  //------------------------------------------------------ Field NEWPassword
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    obscureText: true,
                                    focusNode: focusUserNewCardPassword,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      labelText: 'Nova Senha',
                                      hintText: "Digite sua nova senha",
                                      hintStyle: TextStyle(
                                        fontSize: constraints.maxWidth * 0.04,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    controller: _controllerCardNewPassword,
                                    validator: validarNewPassword,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.04,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    onFieldSubmitted: (term) {
                                      focusUserNewCardPassword.unfocus();
                                      FocusScope.of(context).requestFocus(
                                          focusUserNewCardPasswordConfirm);
                                    },
                                  ),

                                  //------------------------------------------------------ Field NEWPassword confirm
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    obscureText: true,
                                    focusNode: focusUserNewCardPasswordConfirm,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      labelText: 'Nova Senha',
                                      hintText:
                                          "Digite sua nova senha novamente",
                                      hintStyle: TextStyle(
                                        fontSize: constraints.maxWidth * 0.04,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    controller:
                                        _controllerCardNewPasswordConfirm,
                                    validator: validarNewPasswordConfirm,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.04,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    onFieldSubmitted: (term) {
                                      focusUserNewCardPasswordConfirm.unfocus();
                                      FocusScope.of(context)
                                          .requestFocus(focusUserCardCvv);
                                    },
                                  ),

                                  //------------------------------------------------------ Field CVV
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    obscureText: false,
                                    focusNode: focusUserCardCvv,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      labelText: 'CVV',
                                      hintText: "Digite o CVV do seu cartão",
                                      hintStyle: TextStyle(
                                        fontSize: constraints.maxWidth * 0.04,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    controller: _controllerCardCvv,
                                    validator: validarCVV,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.04,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    onFieldSubmitted: (term) {
                                      focusUserCardCvv.unfocus();
                                      FocusScope.of(context)
                                          .requestFocus(focusUserTermoLGPD);
                                    },
                                  ),
                                  // Checkbox(
                                  //     value: _value2,
                                  //     activeColor: Colors.green,
                                  //     onChanged: (bool newValue) {
                                  //       setState(() {
                                  //         _value2 = newValue;
                                  //       });
                                  //       Text('Remember me');
                                  //     }),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _value2,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            _value2 = newValue;
                                            if (_value2 == true) {
                                              lgpd = 'S';
                                            } else if (_value2 == false) {
                                              lgpd = 'N';
                                            } else {
                                              lgpd = '-';
                                            }
                                          });
                                        },
                                      ),

                                      RichText(
                                        text: TextSpan(
                                          text: "Aceito os termos de uso -",
                                          style: TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.03,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                      // TDButton(
                                      //   text: "Editar",
                                      //   callback: () => goToTerm(),
                                      // ),
                                      FlatButton(
                                        onPressed: () => goToTerm(),
                                        child: Text(" Ler o termo de uso"),
                                      )
                                      // RichText(
                                      //     text: TextSpan(
                                      //   text: " Ler o termo de uso",
                                      //   style: TextStyle(
                                      //     fontSize: constraints.maxWidth * 0.03,
                                      //     fontWeight: FontWeight.w600,
                                      //     color: Theme.of(context).primaryColor,
                                      //   ),
                                      // ))
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: lgpd == 'N'
                                            ? backgroundColor
                                            : accentColor,
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
                                      child: lgpd == null || lgpd == 'N'
                                          ? TDButton(
                                              text:
                                                  'Aceite o termo para continuar',
                                              // onPressed: () {
                                              callback: () {},
                                            )
                                          : TDButton(
                                              text: 'Enviar',
                                              // onPressed: () {
                                              callback: () {
                                                if (_formKey.currentState
                                                    .validate()) {
                                                  _formKey.currentState.save();
                                                  var dados = new PasswordModel(
                                                    userNewPassword:
                                                        _controllerCardNewPassword
                                                            .text,
                                                    userOldPassword:
                                                        _controllerCardOldPassword
                                                            .text,
                                                    userCvv:
                                                        _controllerCardCvv.text,
                                                    userCardNunber:
                                                        widget.cardNumber,
                                                    userCpf:
                                                        _controllerCPF.text,
                                                  );
                                                  handlePassword(dados);
                                                } else {
                                                  Scaffold.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          "Ops! Algo errado não da certo"),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          // child: LayoutBuilder(
          //   builder: (_, constraints) {
          //     return Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(color: Colors.red),
          //         Container(color: Colors.blue),
          //       ],
          //     );
          //   },
          // ),
        ),
      ),
    );
  }

  void goToTerm() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeTermView(),
      ),
    );
  }

  String validarCpf(String value) {
    String patttern = r'([\d\w])';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Por favor, informe o CPF";
    } else if (value.length != 14) {
      return "O CPF deve ter 11 números! Ex: '123-456-789-10' ";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! O número do CPF so deve conter dígitos!'";
    }
    return null;
  }

  String validarOldPassword(String value) {
    String patttern = r'(^[0-9+\-]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return "Por favor, informe a senha atual!";
    } else if (value.length != 4) {
      return "A senha deve ter 4 números!";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! A senha deve conter somente números!'";
    }
    return null;
  }

  String validarNewPassword(String value) {
    String patttern = r'(^[0-9+\-]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return "Por favor, informe sua nova senha!";
    } else if (value.length != 4) {
      return "A nova senha deve ter 4 números!";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! A senha deve conter somente números!'";
    } else if (_controllerCardNewPassword.text ==
        _controllerCardOldPassword.text) {
      return "A nova Senha não pode ser igual a antiga";
    }
    return null;
  }

  String validarNewPasswordConfirm(String value) {
    String patttern = r'(^[0-9+\-]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return "Por favor, confirme a senha!";
    } else if (value.length != 4) {
      return "A senha deve ter 4 números!";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! A senha deve conter somente números!'";
    } else if (_controllerCardNewPassword.text !=
        _controllerCardNewPasswordConfirm.text) {
      return "Senha não confere";
    }
    return null;
  }

  String validarCVV(String value) {
    String patttern = r'(^[0-9+\-]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return "Por favor, informe o CVV do cartão";
    } else if (value.length != 3) {
      return "O CVV deve ter 3 números!";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! O CVV do Cartão so deve conter dígitos!'";
    }
    return null;
  }
}
