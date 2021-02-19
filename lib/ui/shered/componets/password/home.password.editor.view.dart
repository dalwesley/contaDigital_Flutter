import 'package:flutter/material.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/shered/componets/top.components.dart';
import 'package:card/ui/shered/componets/password/password.update.widget.dart';

class HomePasswordEditor extends StatelessWidget {
  HomePasswordEditor({Key key, @required this.cardNumber}) : super(key: key);
  final cardNumber;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: size.width,
        height: size.height,
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PasswordUpdate(cardNumber: cardNumber),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
