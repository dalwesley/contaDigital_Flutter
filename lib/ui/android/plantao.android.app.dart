import 'package:flutter/material.dart';
import 'package:card/blocs/card.bloc.dart';
import 'package:card/blocs/home.bloc.dart';
import 'package:card/blocs/extract.bloc.dart';
import 'package:card/blocs/notification.bloc.dart';
import 'package:card/blocs/theme.bloc.dart';
import 'package:card/blocs/user.bloc.dart';
import 'package:card/store/app.store.dart';
import 'package:card/store/card.store.dart';
import 'package:card/themes/light.theme.dart';
import 'package:card/ui/android/views/intro.screen.view.dart';
import 'package:provider/provider.dart';

class cardAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc(),
        ),
        ChangeNotifierProvider<ExtractBloc>.value(
          value: ExtractBloc(),
        ),
        Provider<AppStore>.value(
          value: AppStore(),
        ),
        Provider<CardStore>.value(
          value: CardStore(),
        ),
        ChangeNotifierProvider<CardBloc>.value(
          value: CardBloc(),
        ),
        ChangeNotifierProvider<UserBloc>.value(
          value: UserBloc(),
        ),
        ChangeNotifierProvider<ThemeBloc>.value(
          value: ThemeBloc(),
        ),
        ChangeNotifierProvider<NotificationBloc>.value(
          value: NotificationBloc(),
        ),
      ],
      child: MainAndroid(),
    );
  }
}

class MainAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final ThemeBloc bloc = Provider.of<ThemeBloc>(context);
    return MaterialApp(
      title: "New Plantão Card",
      theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      // routes: {
      //   'IntroScreen': (context) => IntroScreen(),
      //   'LoginView': (context) => LoginView(),
      //   'AtualizaDados': (context) => AtualizaDados(),
      //   'HomeView': (context) => HomeView()
      // },
      home: IntroScreen(),
    );
  }
}
