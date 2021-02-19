import 'package:flutter/widgets.dart';
import 'package:card/settings.dart';
import 'package:card/ui/shered/progress-indicator.widget.dart';

class Loader extends StatelessWidget {
  final object;
  final Function callback;

  Loader({@required this.object, @required this.callback});

  @override
  Widget build(BuildContext context) {
    if (Settings.cardNumber == null)
      return Center(
        child: Text("Selecione uma opção de extrato"),
      );

    if (object == null)
      return Center(
        child: GenericProgressIndicator(),
      );

    if (object.length == 0)
      return Center(
        child: Text("Nenhum item encontrado"),
      );

    return callback();
  }
}
