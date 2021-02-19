import 'package:card/email.dart';
import 'package:card/models/cardDetails.model.dart';
import 'models/cardstatus.model.dart';
import 'models/user.model.dart';

class Settings {
  static String apiUrl = "api/teste";
  static String theme = "light";
  static CardStatusModel cardStatusModel;
  static CardDetailsModel cardDetails;
  static String cardNumber;
  static UserModel userModel;
  static var email = Email('email@gmail.com', '123456');
}
