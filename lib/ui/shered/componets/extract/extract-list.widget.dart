import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:card/settings.dart';
import 'package:card/store/app.store.dart';
import 'package:card/ui/shered/componets/busy.dart';
import 'package:provider/provider.dart';

class ExtractList extends StatefulWidget {
  @override
  _ExtractListState createState() => _ExtractListState();
}

class _ExtractListState extends State<ExtractList> {
  var date = new DateTime.now();
  // final _dateFormat = new DateFormat('dd/MM/yyyy');
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            children: [
              Container(
                width: size.width,
                height: size.height * .61,
                child: Observer(
                  builder: (_) => TDBusy(
                    busy: store.busy,
                    child: store.extract.length == 0
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Center(
                                  child:
                                      // Text(
                                      (() {
                                    if (store.extractState == '5') {
                                      return Column(
                                        children: <Widget>[
                                          Text(
                                              Settings.cardDetails.holderName +
                                                  ',',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5),
                                          Center(
                                            child: Text(
                                                "Nada nos últimos 5 dias...",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5),
                                          ),
                                        ],
                                      );
                                    } else if (store.extractState == '15') {
                                      return Column(
                                        children: <Widget>[
                                          Text(
                                              Settings.cardDetails.holderName +
                                                  ',',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5),
                                          Text("Nada nos últimos 15 dias...",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5),
                                        ],
                                      );
                                    } else if (store.extractState == '30') {
                                      return Column(
                                        children: <Widget>[
                                          Text(
                                              Settings.cardDetails.holderName +
                                                  ',',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5),
                                          Text("Nada nos últimos 30 dias...",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5),
                                        ],
                                      );
                                    } else if (store.extractState == '60') {
                                      return Column(
                                        children: <Widget>[
                                          Text(
                                              Settings.cardDetails.holderName +
                                                  ',',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5),
                                          Text("Nada nos últimos 60 dias...",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5),
                                        ],
                                      );
                                    } else if (store.extractState == '90') {
                                      return Column(
                                        children: <Widget>[
                                          Text(
                                              Settings.cardDetails.holderName +
                                                  ',',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5),
                                          Text("Nada nos últimos 90 dias...",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5),
                                        ],
                                      );
                                    } else {
                                      return Column(
                                        children: <Widget>[
                                          Icon(Icons.arrow_upward),
                                          Text(
                                              "Selecione uma opção de extrato...",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5),
                                        ],
                                      );
                                    }
                                  })(),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: store.extract.length,
                            itemBuilder: (context, index) {
                              var todo = store.extract[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: 10,
                                  right: 10,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.black26,
                                        offset: new Offset(1, 2.0),
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  // child: Dismissible(
                                  //   key: Key(todo.date.toString()),
                                  child: ListTile(
                                    // leading: todo.date == true
                                    //     ? CircleAvatar(
                                    //         backgroundColor: Colors.white,
                                    //         child: Icon(
                                    //           Icons.cancel,
                                    //           size: 35,
                                    //           // color: Colors.red[50],
                                    //         ),
                                    //         foregroundColor: Colors.red[50],
                                    //       )
                                    //     : todo.date == true
                                    //         ? CircleAvatar(
                                    //             backgroundColor: Colors.white,
                                    //             child: Icon(Icons.check_circle,
                                    //                 size: 35),
                                    //             foregroundColor: backgroundColor)
                                    //         : CircleAvatar(
                                    //             backgroundColor: accentColor,
                                    //             child: Text(
                                    //               todo.date[0],
                                    //               style: TextStyle(
                                    //                   fontSize:
                                    //                       constraints.maxWidth *
                                    //                           0.055,
                                    //                   fontWeight: FontWeight.w600),
                                    //             ),
                                    //             foregroundColor: Colors.white,
                                    //           ),
                                    title: Text(todo.description,
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                        softWrap: false,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4),
                                    subtitle: Text(todo.date,
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                        softWrap: false,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3),
                                    trailing: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "R\$: " + todo.value.toString(),
                                          style:
                                              // todo.date == true
                                              //     ? TextStyle(
                                              //         fontSize:
                                              //             constraints.maxWidth * 0.03,
                                              //         fontWeight: FontWeight.w300,
                                              //       )
                                              //     : todo.date == true
                                              //         ? TextStyle(
                                              //             fontSize:
                                              //                 constraints.maxWidth *
                                              //                     0.03,
                                              //             fontWeight: FontWeight.w300,
                                              //           )
                                              //         :
                                              TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.04,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        // Flexible(
                                        //   child: Text(
                                        //     todo.date.toString(),
                                        //     style: todo.date == true
                                        //         ? TextStyle(
                                        //             fontSize:
                                        //                 constraints.maxWidth * 0.03,
                                        //             fontWeight: FontWeight.w300,
                                        //           )
                                        //         : todo.date == true
                                        //             ? TextStyle(
                                        //                 fontSize:
                                        //                     constraints.maxWidth *
                                        //                         0.03,
                                        //                 fontWeight: FontWeight.w300,
                                        //               )
                                        //             : TextStyle(
                                        //                 fontSize:
                                        //                     constraints.maxWidth *
                                        //                         0.03,
                                        //                 fontWeight: FontWeight.w600,
                                        //               ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    // isThreeLine: true,
                                    // onTap: () => navegarParaCliente(
                                    //   context,
                                    //   store.agendamentos[index],
                                    // ),
                                    // enabled: false,
                                  ),
                                  // onDismissed: todo.date ==
                                  //             true &&
                                  //         todo.date == false
                                  //     ? (direction) {
                                  //         if (direction ==
                                  //             DismissDirection.endToStart) {
                                  //           controller.markAsDone(todo).then(
                                  //             (data) {
                                  //               Navigator.of(context)
                                  //                   .pop(); //excepition aqui
                                  //             },
                                  //           ).catchError(
                                  //             (err) {
                                  //               Scaffold.of(context)
                                  //                   .showSnackBar(snackBar);
                                  //             },
                                  //           );
                                  //         } else {
                                  //           controller.markAsDone(todo).then(
                                  //             (data) {
                                  //               Navigator.of(context)
                                  //                   .pop(); //excepition aqui
                                  //               Scaffold.of(context)
                                  //                   .showSnackBar(snackBar);
                                  //             },
                                  //           ).catchError(
                                  //             (err) {
                                  //               Scaffold.of(context)
                                  //                   .showSnackBar(snackBar);
                                  //             },
                                  //           );
                                  //         }
                                  //       }
                                  // : todo.agendamentoCancelado == true &&
                                  //         todo.agendamentoConcluido == false
                                  //     ? (direction) {
                                  //         if (direction ==
                                  //             DismissDirection.endToStart) {
                                  //           controller.cancel(todo).then(
                                  //             (data) {
                                  //               Navigator.of(context)
                                  //                   .pop(); //excepition aqui
                                  //             },
                                  //           ).catchError(
                                  //             (err) {
                                  //               Scaffold.of(context)
                                  //                   .showSnackBar(snackBar);
                                  //             },
                                  //           );
                                  //         } else {
                                  //           controller.cancel(todo).then(
                                  //             (data) {
                                  //               Navigator.of(context)
                                  //                   .pop(); //excepition aqui
                                  //               Scaffold.of(context)
                                  //                   .showSnackBar(snackBar);
                                  //             },
                                  //           ).catchError(
                                  //             (err) {
                                  //               Scaffold.of(context)
                                  //                   .showSnackBar(snackBar);
                                  //             },
                                  //           );
                                  //         }
                                  //       }
                                  //     : (direction) {
                                  //         if (direction ==
                                  //             DismissDirection.endToStart) {
                                  //           controller.markAsDone(todo).then(
                                  //             (data) {
                                  //               Navigator.of(context)
                                  //                   .pop(); //excepition aqui
                                  //             },
                                  //           ).catchError(
                                  //             (err) {
                                  //               Scaffold.of(context)
                                  //                   .showSnackBar(snackBar);
                                  //             },
                                  //           );
                                  //         } else {
                                  //           controller.cancel(todo).then(
                                  //             (data) {
                                  //               Navigator.of(context)
                                  //                   .pop(); //excepition aqui
                                  //               Scaffold.of(context)
                                  //                   .showSnackBar(snackBar);
                                  //             },
                                  //           ).catchError(
                                  //             (err) {
                                  //               Scaffold.of(context)
                                  //                   .showSnackBar(snackBar);
                                  //             },
                                  //           );
                                  //         }
                                  //       },
                                  // background: Container(
                                  //   //excepition aqui
                                  //   width: double.infinity,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(8.0),
                                  //     child: Row(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.center,
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.start,
                                  //       children: todo.date == true &&
                                  //               todo.date == false
                                  //           ? <Widget>[
                                  //               Icon(Icons.cached),
                                  //               Text("Desfazer Atendimento"),
                                  //             ]
                                  //           : todo.date == true &&
                                  //                   todo.date == false
                                  //               ? <Widget>[
                                  //                   Icon(Icons.cached),
                                  //                   Text("Desfazer Cancelamento"),
                                  //                 ]
                                  //               : <Widget>[
                                  //                   Icon(Icons.cancel),
                                  //                   Text("Cancelar Atendimento"),
                                  //                 ],
                                  //     ),
                                  //   ),
                                  //   color: todo.date == true && todo.date == false
                                  //       ? Colors.blue.withOpacity(0.3)
                                  //       : todo.date == true && todo.date == false
                                  //           ? Colors.red.withOpacity(0.3)
                                  //           : Colors.red.withOpacity(0.3),
                                  // ),
                                  // secondaryBackground: Container(
                                  //   width: double.infinity,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(8.0),
                                  //     child: Row(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.center,
                                  //       mainAxisAlignment: MainAxisAlignment.end,
                                  //       children: todo.date == true &&
                                  //               todo.date == false
                                  //           ? <Widget>[
                                  //               Text("Desfazer Atendimento"),
                                  //               Icon(Icons.cached),
                                  //             ]
                                  //           : todo.date == true &&
                                  //                   todo.date == false
                                  //               ? <Widget>[
                                  //                   Text("Desfazer Cancelamento"),
                                  //                   Icon(Icons.cached),
                                  //                 ]
                                  //               : <Widget>[
                                  //                   Text("Finalizar atendido"),
                                  //                   Icon(Icons.check),
                                  //                 ],
                                  //     ),
                                  //   ),
                                  //   color: todo.date == true && todo.date == false
                                  //       ? Colors.blue.withOpacity(0.3)
                                  //       : todo.date == true && todo.date == false
                                  //           ? Colors.red.withOpacity(0.3)
                                  //           : Colors.blue.withOpacity(0.3),
                                  // ),
                                ),
                                // ),
                              );
                            },
                          ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      //   ],
      // ),
    );
  }

  // void navegarParaCliente(
  //     BuildContext context, AgendamentoModel agendamentoModel) async {
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => AgendamentoDetailsView(agendamentoModel),
  //     ),
  //   );
  // }
}
