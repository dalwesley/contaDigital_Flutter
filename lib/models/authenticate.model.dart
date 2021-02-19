class AuthenticateModel {
  int idReturn;
  String message;
  String cardNumber;

  AuthenticateModel({this.idReturn, this.message, this.cardNumber});

  AuthenticateModel.fromJson(Map<String, dynamic> json) {
    idReturn = json['id_return'];
    message = json['message'];
    cardNumber = json['cardNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_return'] = this.idReturn;
    data['message'] = this.message;
    data['cardNumber'] = this.cardNumber;
    return data;
  }
}
