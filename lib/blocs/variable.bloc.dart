import 'package:flutter/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class VariableBloc extends ChangeNotifier {
  var cardTextInputFormatter =
      MaskTextInputFormatter(mask: "####-####-####-####");

  final TextEditingController controllerCardNumber = TextEditingController();
  final TextEditingController controllerCardPassword = TextEditingController();
}
