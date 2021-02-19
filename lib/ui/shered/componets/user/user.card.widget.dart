// import 'package:flutter/material.dart';
// import 'package:card/themes/light.theme.dart';
// import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

// class UserCard extends StatelessWidget {
//   // final UserModel item;

//   // UserCard({@required this.item});

//   @override
//   Widget build(BuildContext context) {
//     void exibirUserCard() {
//       slideDialog.showSlideDialog(
//         context: context,
//         barrierColor: Colors.white.withOpacity(0.7),
//         pillColor: dangerColor,
//         backgroundColor: Colors.white,
//         // child: EstabilishmentDetails(item: item),
//       );
//     }

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             new BoxShadow(
//               color: Colors.black26,
//               offset: new Offset(1, 2.0),
//               blurRadius: 3,
//               spreadRadius: 1,
//             ),
//           ],
//         ),
//         child: ListTile(
//           // leading: Icon(Icons.add),
//           // leading: Text(item.userName),
//           // title: Text(item.userAddress),
//           // trailing: Icon(Icons.done),
//           // subtitle: Text(item.texto),
//           // selected: true,
//           onTap: () {
//             // bloc.changeCategory(
//             //   item.number.toString(),
//             // );

//             exibirUserCard();
//           },
//         ),
//       ),
//     );

//     // Card(
//     //   // shadowColor: item.id.toString() == bloc.selectedCategory
//     //   //     ? Theme.of(context).primaryColor
//     //   //     : Colors.white,
//     //   // color: item.id.toString() == bloc.selectedCategory
//     //   //     ? accentColor
//     //   //     : backgroundColor,
//     //   elevation: 1,
//     //   child: FlatButton(
//     //     child: Column(
//     //       crossAxisAlignment: CrossAxisAlignment.stretch,
//     //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//     //       children: [
//     //         Container(
//     //           child: Text(
//     //             item.notificationId.toString(),
//     //             // style: item.id.toString() == bloc.selectedCategory
//     //             //     ? TextStyle(
//     //             //         fontSize: 15,
//     //             //         color: backgroundColor,
//     //             //         fontWeight: FontWeight.w700,
//     //             //       )
//     //             //     : TextStyle(fontSize: 15, color: primaryColor),
//     //           ),
//     //         ),
//     //         Container(
//     //           child: Text(
//     //             item.titulo,
//     //             // style: item.id.toString() == bloc.selectedCategory
//     //             //     ? TextStyle(
//     //             //         fontSize: 11,
//     //             //         color: backgroundColor,
//     //             //         fontWeight: FontWeight.w700,
//     //             //       )
//     //             //     : TextStyle(fontSize: 11, color: primaryColor),
//     //             textAlign: TextAlign.left,
//     //             // overflow: TextOverflow.ellipsis,
//     //             // maxLines: 3,
//     //             // softWrap: true,
//     //           ),
//     //         ),
//     //       ],
//     //     ),
//     //     //     Image.asset("assets/categories/${Settings.theme}/${item.name}.png"),
//     //     onPressed: () {
//     //       // bloc.changeCategory(
//     //       //   item.id.toString(),
//     //       // );
//     //       // Navigator.push(
//     //       //   context,
//     //       //   MaterialPageRoute(
//     //       //     builder: (context) => HomeEstabilishmentView(
//     //       //       category: item.customAssetName,
//     //       //     ),
//     //       //   ),
//     //       // );
//     //     },
//     //   ),
//     // );
//   }
// }
