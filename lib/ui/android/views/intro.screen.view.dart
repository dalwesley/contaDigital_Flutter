import 'dart:async';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/android/views/login.view.dart';
import 'package:card/ui/android/views/login.view.password.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  String cardValue;
  bool boolValue;

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
    // controllerCardNumber = new TextEditingController(text: cardValue);
    //Return bool
    boolValue = prefs.getBool('boolValue');
  }

  @override
  void initState() {
    super.initState();
    getValuesSF();

    Timer(Duration(seconds: 5), () {
      if ((boolValue == true) && (cardValue.isNotEmpty)) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) =>
                LoginViewPassword(cardNumber: cardValue),
            // HomeView(),
          ),
        );
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => LoginView(),
            // HomeView(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/img3.png',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstOut),
            ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Container(
                          //   width: constraints.maxWidth,
                          //   height: constraints.maxHeight / 3,
                          //   // color: Colors.red,
                          // ),
                          // Container(
                          //   // width: constraints.maxWidth,
                          //   height: constraints.maxHeight / 2,
                          //   child:
                          DelayedDisplay(
                            delay: Duration(seconds: 1),
                            child: Image.asset(
                              "assets/images/logocard.png",
                              width: constraints.maxHeight * 0.4,
                              height: constraints.maxHeight * 0.3,
                            ),
                          ),
                          // ),
                          // Container(
                          //   width: constraints.maxWidth,
                          //   height: constraints.maxHeight / 2,
                          //   child:
                          Center(
                            child: DelayedDisplay(
                              delay: Duration(seconds: 2),
                              child: Text(
                                "Bem Vindo ao Novo!",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                          // ),
                        ],
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
}
