import 'package:flutter/material.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/shered/componets/top.components.dart';

class HelpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
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
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //--------------------------------------------------------container do logo
                          Container(
                              width: constraints.maxWidth,
                              height: constraints.maxHeight / 3,
                              child: Column(
                                children: [
                                  TopComponents(),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Dúvidas mais frequentes:",
                                        style: TextStyle(
                                            fontSize: 20.0, color: textColor),
                                      )),
                                  Image.asset(
                                    "assets/images/seta_card.png",
                                    width: constraints.maxWidth * 0.08,
                                  ),
                                ],
                              )),
                          //----------------------------------------------------------------- container dos form
                          Container(
                            color: Colors.yellow,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight / 3,
                          ),
                          //------------------------------------------------------- container do button
                          Container(
                            color: Colors.blue,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight / 3,
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
}
