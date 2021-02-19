import 'package:flutter/material.dart';
import 'package:card/models/user.model.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/shered/componets/top.components.dart';
import 'package:card/ui/shered/componets/user/user.editor.widget.dart';

class HomeUserEditor extends StatelessWidget {
  final UserModel userModel;
  HomeUserEditor({@required this.userModel});

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
                TopComponents(),
                Expanded(child: UserEditor(userModel: userModel)),
              ],
            );
          },
        ),
      ),
    );
  }
}
