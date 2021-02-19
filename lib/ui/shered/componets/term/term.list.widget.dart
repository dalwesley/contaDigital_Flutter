import 'package:flutter/material.dart';
import 'package:card/blocs/user.bloc.dart';
import 'package:card/settings.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/android/views/home.view.dart';
import 'package:card/blocs/card.bloc.dart';
import '../button.widget.dart';

class TermList extends StatefulWidget {
  TermList({Key key, @required this.comingFrom}) : super(key: key);
  final comingFrom;
  @override
  _TermListState createState() => _TermListState();
}

class _TermListState extends State<TermList> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  bool _value2 = false;
  String lgpd;
  var userBloc = new UserBloc();
  var cardBloc = new CardBloc();

  handleLgpd(dado) async {
    userBloc.acceptLgpd(dado).then((data) {
      if (data == 200) {
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
    userBloc.details(Settings.cardNumber);
    cardBloc.details(Settings.cardNumber);
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

  // onComplete() {
  //   setState(() {
  //     busy = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                                "Termo de Consentimento para Tratamento de Dados",
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 10),
                            Text(
                                "Através do presente instrumento, eu, aqui denominado (a) como TITULAR, aceito, "
                                "consinto e concordo que a Empresa teste, "
                                "CNPJ nº 312312312312312, com sede em São José dos Campos, no estado de São Paulo, "
                                "em razão do contrato de convênio firmado com a empresa, "
                                "realize o tratamento de meus dados pessoais sensíveis para finalidade específica, "
                                "em conformidade com a Lei nº 13.709 – Lei Geral de Proteção de Dados Pessoais (LGPD),"
                                "Controladora fica autorizada a tomar decisões referentes ao tratamento e a realizar o tratamento dos seguintes dados,"
                                "Nome completo; Data de nascimento; Número e imagem da Carteira de Identidade (RG);"
                                "Número e imagem do Cadastro de Pessoas Físicas (CPF); Estado civil; Endereço completo;"
                                "Números de telefone, WhatsApp e endereços de e-mail, inseridos pelo Titular,"
                                "com a intenção de obter a prestação dos serviços ofertados pela mesma através do Cartão Plantão Bem-Estar. ",
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 10),
                            Text("Finalidades do Tratamento dos Dados",
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 10),
                            Text(
                                "O tratamento dos dados pessoais listados neste termo tem a finalidade de possibilitar que a Controladora"
                                "mantenha em seu banco de dados informações do Titular para consecução do contrato de convênio firmado"
                                "com a empregadora do Titular. ",
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 10),
                            Text("Compartilhamento de Dados",
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 10),
                            Text(
                                "Os dados pessoais do Titular NÃO serão compartilhados pela Controladora com outros agentes de tratamento de dados,"
                                "os dados pessoais formam o banco de dados da Controladora e serão usados somente para a finalidade acima descritas,"
                                "sempre sendo observados os princípios e as garantias estabelecidas pela Lei nº 13.709. ",
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 10),
                            Text("Segurança dos Dados",
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 10),
                            Text(
                                "A Controladora responsabiliza-se pela manutenção de medidas de segurança, "
                                "técnicas e administrativas aptas a proteger os dados pessoais de acessos não autorizados e de situações "
                                "acidentais ou ilícitas de destruição, perda, alteração, comunicação ou qualquer forma de tratamento inadequado "
                                "ou ilícito.",
                                style: Theme.of(context).textTheme.headline4),
                            Text(
                                "Em conformidade ao art. 48 da Lei nº 13.709, o Controlador comunicará ao Titular "
                                "e à Autoridade Nacional de Proteção de Dados (ANPD) a ocorrência de incidente de "
                                "segurança que possa acarretar risco ou dano relevante ao Titular. ",
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 10),
                            Text("Término do Tratamento dos Dados",
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 10),
                            Text(
                                "A Controladora poderá manter e tratar os dados pessoais do Titular durante todo o período "
                                "em que os mesmos forem pertinentes ao alcance das finalidades listadas neste termo, "
                                "o término do tratamento de dados será automático após a saída do Titular da sua empregadora. ",
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 10),
                            Text("Direitos do Titular",
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 10),
                            Text(
                                "O Titular tem direito a obter da Controladora, em relação aos dados por ele tratados, "
                                " a qualquer momento e mediante requisição: \nI - confirmação da existência de tratamento; "
                                " \nII - acesso aos dados; \nIII - correção de dados incompletos, inexatos ou desatualizados; "
                                " \nIV - anonimização, bloqueio ou eliminação de dados desnecessários, excessivos ou tratados"
                                " em desconformidade com o disposto na Lei nº 13.709; \nV - portabilidade dos dados a outro "
                                " fornecedor de serviço ou produto, mediante requisição expressa e observados os segredos "
                                " comercial e industrial, de acordo com a regulamentação do órgão controlador; \nVI - portabilidade "
                                " dos dados a outro fornecedor de serviço ou produto, mediante requisição expressa, de acordo com"
                                " a regulamentação da autoridade nacional, observados os segredos comercial e industrial; \nVII - "
                                " eliminação dos dados pessoais tratados com o consentimento do titular, exceto nas hipóteses previstas"
                                " no art. 16 da Lei nº 13.709; \nVIII - informação das entidades públicas e privadas com as quais o "
                                " controlador realizou uso compartilhado de dados; \nIX - informação sobre a possibilidade de não"
                                " fornecer consentimento e sobre as consequências da negativa; \nX - revogação do consentimento,"
                                " nos termos do § 5º do art. 8º da Lei nº 13.709. ",
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 10),
                            Text("Direito de Revogação do Consentimento",
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 10),
                            Text(
                                "Este consentimento poderá ser revogado pelo Titular,"
                                "a qualquer momento, mediante solicitação via e-mail ou correspondência ao Controlador. ",
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 30),
                            widget.comingFrom != 'password'
                                ? Text(
                                    "Por aceitar o seguinte termo assino o presente",
                                    style:
                                        Theme.of(context).textTheme.headline4)
                                : SizedBox(height: 2),
                            SizedBox(height: 30),
                            widget.comingFrom != 'password'
                                ? Row(
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
                                          text:
                                              "Aceito os termos de uso e lgpd",
                                          style: TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.03,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox(height: 1),
                          ],
                        ),
                      ),
                      widget.comingFrom != 'password'
                          ? Padding(
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
                                        text: 'Aceite o termo para continuar',
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
                                            handleLgpd(Settings.cardNumber);
                                          } else {
                                            Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Ops! Algo deu errado"),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                              ),
                            )
                          : Padding(
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
                                  text: 'Voltar e assinar',
                                  // onPressed: () {
                                  callback: () {
                                    Navigator.pop(context);
                                  },
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
    );
  }
}
