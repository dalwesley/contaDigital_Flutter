import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:card/blocs/user.bloc.dart';
import 'package:card/models/user.model.dart';
import 'package:card/themes/light.theme.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../settings.dart';
import 'package:card/ui/shered/componets/button.widget.dart';

import '../../progress-indicator.widget.dart';

class UserEditor extends StatefulWidget {
  final UserModel userModel;
  UserEditor({@required this.userModel});

  @override
  _UserEditorState createState() => _UserEditorState();
}

enum SingingCharacter { lafayette, jefferson }

class _UserEditorState extends State<UserEditor> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  String genre;
  String state;
  var busy = false;

  TextEditingController _userCpfController;
  TextEditingController _userNameController;
  TextEditingController _userEmailController;
  TextEditingController _userSexoController;
  TextEditingController _userPhoneController;
  TextEditingController _userBirthDateController;
  TextEditingController _userAddressController;
  TextEditingController _userNumberController;
  TextEditingController _userComplementController;
  TextEditingController _userDistrictController;
  TextEditingController _userCepController;
  TextEditingController _userCityController;
  TextEditingController _userStateController;

  FocusNode focusUserCpf = FocusNode();
  FocusNode focusUserName = FocusNode();
  FocusNode focusUserEmail = FocusNode();
  FocusNode focusUserSexo = FocusNode();
  FocusNode focusUserPhone = FocusNode();
  FocusNode focusUserBirthDate = FocusNode();
  FocusNode focusUserAddress = FocusNode();
  FocusNode focusUserNumber = FocusNode();
  FocusNode focusUserComplement = FocusNode();
  FocusNode focusUserDistrict = FocusNode();
  FocusNode focusUserCep = FocusNode();
  FocusNode focusUserCity = FocusNode();
  FocusNode focusUserState = FocusNode();

  var cpfTextInputFormatter = MaskTextInputFormatter(mask: "###.###.###-##");
  var phoneTextInputFormatter = MaskTextInputFormatter(mask: "(##)#####-####");
  var birthDateTextInputFormatter = MaskTextInputFormatter(mask: "##/##/####");
  var cepTextInputFormatter = MaskTextInputFormatter(mask: "#####-###");

  // var maskFormatter = new MaskTextInputFormatter(mask: '+# (###) ###-##-##', filter: { "#": RegExp(r'[0-9]') });

  @override
  void initState() {
    super.initState();

    _userCpfController = new MaskedTextController(
        mask: '000.000.000-00', text: widget.userModel.userCpf);

    // _userCpfController =
    //     new TextEditingController(text: widget.userModel.userCpf);
    _userEmailController =
        new TextEditingController(text: widget.userModel.userEmail);
    _userSexoController =
        new TextEditingController(text: widget.userModel.userSexo);
    _userPhoneController =
        TextEditingController(text: widget.userModel.userPhone);
    _userBirthDateController =
        new TextEditingController(text: widget.userModel.userBirthDate);
    _userAddressController =
        new TextEditingController(text: widget.userModel.userAddress);
    _userNumberController =
        new TextEditingController(text: widget.userModel.userNumber);
    _userComplementController =
        new TextEditingController(text: widget.userModel.userComplement);
    _userDistrictController =
        new TextEditingController(text: widget.userModel.userDistrict);
    _userCepController =
        new TextEditingController(text: widget.userModel.userCep);
    _userCityController =
        new TextEditingController(text: widget.userModel.userCity);
    _userStateController =
        new TextEditingController(text: widget.userModel.userState);
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
      if (busy == true) {
        busy = false;
      } else {
        busy = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserBloc bloc = Provider.of<UserBloc>(context);

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          color: backgroundColor,
          width: size.width,
          height: size.height,
          child: LayoutBuilder(
            builder: (_, constraints) {
              return SingleChildScrollView(
                child: Padding(
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
                    child: Column(
                      children: <Widget>[
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
                                " Meus Dados ",
                                style:
                                    TextStyle(fontSize: 20.0, color: textColor),
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
                            "Seus dados são confidenciais, não usaremos para fins comerciais",
                            style: TextStyle(fontSize: 15.0, color: textColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          color: backgroundColor,
                          width: double.infinity,
                          child: Center(
                            child: new Text(
                              'Dados Pessoais',
                              style: new TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                        //------------------------------------------- Form cpf
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [cpfTextInputFormatter],
                                obscureText: false,
                                focusNode: focusUserCpf,
                                // textAlign: TextAlign.center,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  // icon: Icon(Icons.ac_unit_outlined),
                                  labelText: 'Cpf',
                                  hintText: "Digite seu Cpf",
                                  hintStyle: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                controller: _userCpfController,
                                validator: validarCpf,
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                                onFieldSubmitted: (term) {
                                  focusUserCpf.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(focusUserEmail);
                                },
                              ),
                              //------------------------------------------- Form Email
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                // inputFormatters: [phoneTextInputFormatter],
                                obscureText: false,
                                focusNode: focusUserEmail,
                                // textAlign: TextAlign.center,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  // icon: Icon(Icons.ac_unit_outlined),
                                  labelText: 'Email',
                                  hintText: "Digite seu Email",
                                  hintStyle: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                controller: _userEmailController,
                                validator: validarEmail,
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                                onFieldSubmitted: (term) {
                                  focusUserEmail.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(focusUserPhone);
                                },
                              ),

                              //------------------------------------------- Form phone
                              TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [phoneTextInputFormatter],
                                obscureText: false,
                                focusNode: focusUserPhone,
                                // textAlign: TextAlign.center,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  // icon: Icon(Icons.ac_unit_outlined),
                                  labelText: 'Celular',
                                  hintText: "Digite seu celular",
                                  hintStyle: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                controller: _userPhoneController,
                                validator: validarPhone,
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                                onFieldSubmitted: (term) {
                                  focusUserPhone.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(focusUserBirthDate);
                                },
                              ),
                              //------------------------------------------- Form BirthDate
                              TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [birthDateTextInputFormatter],
                                obscureText: false,
                                focusNode: focusUserBirthDate,
                                // textAlign: TextAlign.center,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  // icon: Icon(Icons.ac_unit_outlined),
                                  labelText: 'Data de nascimento',
                                  hintText: "Digite sua data de nascimento",
                                  hintStyle: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                controller: _userBirthDateController,
                                validator: validarBirthDate,
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                                onFieldSubmitted: (term) {
                                  focusUserBirthDate.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(focusUserSexo);
                                },
                              ),
                              //------------------------------------------- Form sexo
                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gênero',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0,
                                          color: Colors.grey.shade600),
                                    ),
                                    ToggleSwitch(
                                      minWidth: 110.0,
                                      // minHeight: 70.0,
                                      initialLabelIndex:
                                          widget.userModel.userSexo == "F"
                                              ? 0
                                              : widget.userModel.userSexo == "M"
                                                  ? 1
                                                  : 2,
                                      cornerRadius: 20.0,
                                      activeFgColor: primaryColor,
                                      // inactiveBgColor: Colors.grey,
                                      // inactiveFgColor: Colors.white,
                                      labels: [
                                        'Feminino',
                                        'Masculino',
                                        'Outro'
                                      ],
                                      icons: [
                                        FontAwesomeIcons.mars,
                                        FontAwesomeIcons.venus,
                                        FontAwesomeIcons.transgender
                                      ],
                                      iconSize: 30.0,
                                      activeBgColors: [
                                        Colors.pink.shade300,
                                        Colors.blue.shade300,
                                        Colors.purple.shade300
                                      ],
                                      onToggle: (value) {
                                        if (value == 0) {
                                          genre = 'F';
                                        } else if (value == 1) {
                                          genre = 'M';
                                        } else if (value == 2) {
                                          genre = 'O';
                                        } else {
                                          genre = '-';
                                        }
                                        TextField(
                                          enabled: false,
                                          controller: _userSexoController,
                                        );
                                        print('switched to: $genre');
                                      },
                                    ),
                                    SizedBox(height: 30),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          color: backgroundColor,
                          width: double.infinity,
                          child: Center(
                            child: new Text(
                              'Endereço',
                              style: new TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),

                        //------------------------------------------- Form Cep
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [cepTextInputFormatter],
                                obscureText: false,
                                focusNode: focusUserCep,
                                // textAlign: TextAlign.center,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  // icon: Icon(Icons.ac_unit_outlined),
                                  labelText: 'CEP',
                                  hintText: "Digite seu CEP",
                                  hintStyle: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                controller: _userCepController,
                                validator: validarCep,
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                                onFieldSubmitted: (term) {
                                  focusUserCep.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(focusUserAddress);
                                },
                              ),
                              //------------------------------------------- Form Address
                              TextFormField(
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                focusNode: focusUserAddress,
                                // textAlign: TextAlign.center,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  labelText: 'Rua/Av',
                                  hintText: "Digite sua rua/avenida",
                                  hintStyle: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                controller: _userAddressController,
                                validator: validarAddress,
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                                onFieldSubmitted: (term) {
                                  focusUserAddress.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(focusUserNumber);
                                },
                              ),

                              //------------------------------------------- Form Number
                              TextFormField(
                                keyboardType: TextInputType.number,
                                obscureText: false,
                                focusNode: focusUserNumber,
                                // textAlign: TextAlign.center,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  labelText: 'Número',
                                  hintText: "Digite o Numero",
                                  hintStyle: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                controller: _userNumberController,
                                validator: validarNumber,
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                                onFieldSubmitted: (term) {
                                  focusUserNumber.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(focusUserComplement);
                                },
                              ),

                              //------------------------------------------- Form userComplement;
                              TextFormField(
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                focusNode: focusUserComplement,
                                // textAlign: TextAlign.center,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  labelText: 'Complemento',
                                  hintText: "Digite o Complemento",
                                  hintStyle: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                controller: _userComplementController,
                                // validator: validarComplement,
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                                onFieldSubmitted: (term) {
                                  focusUserComplement.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(focusUserDistrict);
                                },
                              ),

                              //------------------------------------------- Form District
                              TextFormField(
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                focusNode: focusUserDistrict,
                                // textAlign: TextAlign.center,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  labelText: 'Bairro',
                                  hintText: "Digite o Bairro",
                                  hintStyle: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                controller: _userDistrictController,
                                validator: validarDistrict,
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                                onFieldSubmitted: (term) {
                                  focusUserDistrict.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(focusUserCity);
                                },
                              ),

                              //------------------------------------------- Form City
                              TextFormField(
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                focusNode: focusUserCity,
                                // textAlign: TextAlign.center,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  labelText: 'Cidade',
                                  hintText: "Digite a Cidade",
                                  hintStyle: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                controller: _userCityController,
                                validator: validarCity,
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                                onFieldSubmitted: (term) {
                                  focusUserCity.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(focusUserState);
                                },
                              ),
                              //------------------------------------------- Form State
                              DropdownButtonFormField(
                                value: widget.userModel.userState == null
                                    ? 'AC'
                                    : widget.userModel.userState,
                                style: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w800,
                                    color: primaryColor),
                                // hint: widget.userModel.userState == null
                                //     ? Text("Estado")
                                //     : Text(widget.userModel.userState),
                                items: [
                                  DropdownMenuItem(
                                      value: 'AC', child: Text('Acre-AC')),
                                  DropdownMenuItem(
                                      value: 'AL', child: Text('Alagoas-AL')),
                                  DropdownMenuItem(
                                      value: 'AP', child: Text('Amapá-AP')),
                                  DropdownMenuItem(
                                      value: 'AM', child: Text('Amazonas-AM')),
                                  DropdownMenuItem(
                                      value: 'BA', child: Text('Bahia-BA')),
                                  DropdownMenuItem(
                                      value: 'CE', child: Text('Ceará-CE')),
                                  DropdownMenuItem(
                                      value: 'ES',
                                      child: Text('Espírito Santo-ES')),
                                  DropdownMenuItem(
                                      value: 'GO', child: Text('Goiás-GO')),
                                  DropdownMenuItem(
                                      value: 'MA', child: Text('Maranhão-MA')),
                                  DropdownMenuItem(
                                      value: 'MT',
                                      child: Text('Mato Grosso-MT')),
                                  DropdownMenuItem(
                                      value: 'MS',
                                      child: Text('Mato Grosso do Sul-MS')),
                                  DropdownMenuItem(
                                      value: 'MG',
                                      child: Text('Minas Gerais-MG')),
                                  DropdownMenuItem(
                                      value: 'PA', child: Text('Pará-PA')),
                                  DropdownMenuItem(
                                      value: 'PB', child: Text('Paraíba-PB')),
                                  DropdownMenuItem(
                                      value: 'PR', child: Text('Paraná-PR')),
                                  DropdownMenuItem(
                                      value: 'PE',
                                      child: Text('Pernambuco-PE')),
                                  DropdownMenuItem(
                                      value: 'PI', child: Text('Piauí-PI')),
                                  DropdownMenuItem(
                                      value: 'RJ',
                                      child: Text('Rio de Janeiro-RJ')),
                                  DropdownMenuItem(
                                      value: 'RN',
                                      child: Text('Rio Grande do Norte-RN')),
                                  DropdownMenuItem(
                                      value: 'RS',
                                      child: Text('Rio Grande do Sul-RS')),
                                  DropdownMenuItem(
                                      value: 'RO', child: Text('Rondônia-RO')),
                                  DropdownMenuItem(
                                      value: 'RR', child: Text('Roraima-RR')),
                                  DropdownMenuItem(
                                      value: 'SC',
                                      child: Text('Santa Catarina-SC')),
                                  DropdownMenuItem(
                                      value: 'SP', child: Text('São Paulo-SP')),
                                  DropdownMenuItem(
                                      value: 'SE', child: Text('Sergipe-SE')),
                                  DropdownMenuItem(
                                      value: 'TO', child: Text('Tocantins-TO')),
                                ],
                                onChanged: (value) {
                                  state = value;
                                  // optionSugestion = value;
                                },
                                validator: validarState,
                                focusNode: focusUserState,
                              ),
                            ],
                          ),
                        ),

                        // _searchCepButton(),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0, left: 20.0, right: 20.0, bottom: 30.0),
                          child: Container(
                            // color: Colors.amber,
                            // width: constraints.maxWidth,
                            // height: constraints.maxHeight / 3,
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
                                          text: 'Enviar',
                                          // onPressed: () {
                                          callback: () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              _formKey.currentState.save();
                                              var model = new UserModel(
                                                userCardNunber:
                                                    Settings.cardNumber,
                                                userCpf: _userCpfController.text
                                                        .replaceAll('-', '')
                                                        .replaceAll('.', '') ??
                                                    widget.userModel.userCpf,
                                                // userName:
                                                //     _userNameController.text ??
                                                //         widget.userModel.userName,
                                                userEmail: _userEmailController
                                                        .text ??
                                                    widget.userModel.userEmail,

                                                userSexo: genre ??
                                                    widget.userModel.userSexo,

                                                userPhone: _userPhoneController
                                                        .text ??
                                                    widget.userModel.userPhone,

                                                userBirthDate:
                                                    _userBirthDateController
                                                            .text ??
                                                        widget.userModel
                                                            .userBirthDate,

                                                userAddress:
                                                    _userAddressController
                                                            .text ??
                                                        widget.userModel
                                                            .userAddress,

                                                userNumber:
                                                    _userNumberController
                                                            .text ??
                                                        widget.userModel
                                                            .userNumber,

                                                userComplement:
                                                    _userComplementController
                                                            .text ??
                                                        widget.userModel
                                                            .userComplement,

                                                userDistrict:
                                                    _userDistrictController
                                                            .text ??
                                                        widget.userModel
                                                            .userDistrict,

                                                userCep: _userCepController
                                                        .text ??
                                                    widget.userModel.userCep,

                                                userCity: _userCityController
                                                        .text ??
                                                    widget.userModel.userCity,

                                                userState: state ??
                                                    widget.userModel.userState,
                                              );
                                              if (model.userCardNunber !=
                                                  null) {
                                                onComplete();
                                                bloc.editUser(model).then(
                                                  (_) {
                                                    Navigator.of(context).pop();
                                                  },
                                                );
                                              }
                                            } else {
                                              onError();
                                            }
                                          },
                                        ),
                                      )
                                    : GenericProgressIndicator(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Widget _searchCepButton() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 20.0),
  //     child: RaisedButton(
  //       onPressed: _searchCep,
  //       child: Text('Consultar'),
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //     ),
  //   );
  // }

  // Future _searchCep() async {
  //   // _searching(true);

  //   // final cep = _searchCepController.text;

  //   final resultCep =
  //       await ViaCepService.fetchCep(cep: _userCepController.text);
  //   print(resultCep.localidade); // Exibindo somente a localidade no terminal

  //   setState(() {
  //     _userAddressController.text = resultCep.logradouro;
  //     _userDistrictController.text = resultCep.bairro;
  //     _userCepController.text = resultCep.cep;
  //     _userCityController.text = resultCep.localidade;
  //     _userStateController.text = resultCep.uf;
  //   });

  //   // _searching(false);
  // }

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

  String validarEmail(String value) {
    String pattern = r'^[\w+.]+@\w+\.\w{2,}(?:\.\w{2})?$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Por favor, informe o Email";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! O Email é inválido";
    } else {
      return null;
    }
  }

  String validarSexo(String value) {
    if (value.length == 0) {
      return "Por favor, informe o sexo";
    } else {
      return null;
    }
  }

  String validarPhone(String value) {
    String patttern = r'(^[0-9+\-+\(+\)]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Por favor, informe o celular";
    } else if (value.length != 14) {
      return "O celular deve ter 11 números! (12)34567-8910";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! Digite somentes os número do celular!";
    }
    return null;
  }

  //validar datas iguais (11/11/1111) ou (00/00/0000)
  String validarBirthDate(String value) {
    String patttern = r'(^[0-9+\-+\(+/)]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Por favor, informe o celular";
    } else if (value.length != 10) {
      return "O Nascimetno deve ter 8 números! 00/00/0000";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! Digite somentes os número!";
    }
    return null;
  }

  String validarAddress(String value) {
    String patttern = r'([\d\w])';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Por favor, informe o nome da rua/avenida";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! A rua/avenida deve conter apenas caracteres de a-z ou A-Z ou 0-9";
    }
    return null;
  }

  String validarNumber(String value) {
    String patttern = r'(^[0-9+\-+\(+\)]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Por favor, informe o numero";
    } else if (value == '0') {
      return "O numero não poed ser '0'!";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! informe o numero!";
    }
    return null;
  }

  String validarDistrict(String value) {
    String patttern = r'(^[\d\w])';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Por favor, informe o Bairro";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! O Bairro deve conter apenas caracteres de a-z ou A-Z e de 0-9";
    }
    return null;
  }

  String validarCep(String value) {
    String patttern = r'(^[0-9+\-]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Por favor, informe o CEP";
    } else if (value.length != 9) {
      return "O CEP deve ter 8 números! Ex: '12345-678' ";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! O número do CEP so deve conter dígitos!'";
    }
    return null;
  }

  String validarCity(String value) {
    String patttern = r'(^[a-zA-Z0-9])';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Por favor, informe a cidade";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! A cidade deve conter apenas caracteres de a-z ou A-Z";
    }
    return null;
  }

  String validarState(String value) {
    String patttern = r'(^[a-zA-Z]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length != 2) {
      return "Por favor, informe o Estado";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! O Estado deve conter apenas caracteres de a-z ou A-Z";
    }
    return null;
  }
}
