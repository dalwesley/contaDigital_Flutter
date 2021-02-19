import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/android/views/home-extrato.view.dart';
import 'package:card/ui/android/views/home-notification.view.dart';
import 'package:card/ui/android/views/home-card.pay.view.dart';
import 'package:card/ui/android/views/home-sugestion.view.dart';
import 'package:card/ui/android/views/home-user.details.view.dart';
import 'package:card/ui/shered/componets/top.components.dart';

import 'home-city.view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex;
  Widget page;
  Widget top;
  var size = MediaQuery;
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      key: _scaffoldKey,
      body: Container(
        width: size.width,
        height: size.height,
        child: Container(
          child: Column(
            children: [
              TopComponents(),
              Expanded(
                child: Container(
                  child: LayoutBuilder(
                    builder: (_, constraints) {
                      return Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight / 1,
                            child: _selectedIndex == null
                                ? HomeNotificationView()
                                : page,
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
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.yellow,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            (() {
              if (index == 0) {
                page = HomeExtratoView();
              } else if (index == 1) {
                page = HomeSugestionView();
              } else if (index == 2) {
                page = HomecardPayView();
              } else if (index == 3) {
                page = HomeCityView();
              } else if (index == 4) {
                page = HomeUserView();
              } else {
                HomeNotificationView();
              }
            })();

            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.calendar_today,
            label: 'Cartão',
          ),
          FFNavigationBarItem(
            iconData: Icons.people,
            label: 'Sugestão',
          ),
          FFNavigationBarItem(
            iconData: Icons.attach_money,
            label: 'Plantão Pay',
          ),
          FFNavigationBarItem(
            iconData: Icons.note,
            label: 'Localizar',
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: 'Eu',
          ),
        ],
      ),

      // BottomBarWithSheet(
      //   selectedIndex: _selectedIndex,
      //   sheetChild: HomecardPayView(),
      //   bottomBarTheme: BottomBarTheme(
      //     heightOpened: size.height * 0.90,
      //     selectedItemBackgroundColor: backgroundColor,
      //     selectedItemIconColor: primaryColor,
      //     backgroundColor: primaryColor,
      //     itemIconColor: backgroundColor,
      //     mainButtonPosition: MainButtonPosition.Middle,
      //   ),
      //   mainActionButtonTheme: MainActionButtonTheme(
      //     color: backgroundColor,
      //     size: size.height * 0.076,
      //     icon: Image.asset(
      //       "assets/images/icon_cardpay.ico",
      //       // width: constraints.maxHeight * 0.4,
      //       // height: constraints.maxHeight * 0.3,
      //     ),

      //     // AssetImage("assets/images/cardSeta.ico")
      //     // Icon(
      //     // Icons.access_time,
      //     // FontAwesomeIcons.dollarSign,
      //     // color: primaryColor,
      //     // size: 35,
      //     // ),
      //   ),
      //   onSelectItem: (index) {
      //     (() {
      //       if (index == 0) {
      //         page = HomeExtratoView();
      //       } else if (index == 1) {
      //         page = HomeSugestionView();
      //       } else if (index == 2) {
      //         page = HomeCityView();
      //       } else if (index == 3) {
      //         page = HomeUserView();
      //       } else {
      //         HomeNotificationView();
      //       }
      //       setState(() => _selectedIndex = index);
      //     })();
      //   },
      //   items: [
      //     BottomBarWithSheetItem(icon: FontAwesomeIcons.solidCreditCard),
      //     BottomBarWithSheetItem(icon: FontAwesomeIcons.solidCommentAlt),
      //     BottomBarWithSheetItem(icon: FontAwesomeIcons.searchLocation),
      //     BottomBarWithSheetItem(icon: FontAwesomeIcons.userAlt),
      //   ],
      // ),
    );
  }
}
