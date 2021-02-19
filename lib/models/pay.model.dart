class PayModel {
  String keyPix;
  String saleCardNumber;
  String saleValue;
  int salePortion;
  String salePassword;

  PayModel(
      {this.keyPix,
      this.saleCardNumber,
      this.salePassword,
      this.salePortion,
      this.saleValue});

  PayModel.fromJson(Map<String, dynamic> json) {
    keyPix = json['keyPix'];
    saleCardNumber = json['saleCardNumber'];
    salePassword = json['salePassword'];
    salePortion = json['salePortion'];
    saleValue = json['saleValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keyPix'] = this.keyPix;
    data['saleCardNumber'] = this.saleCardNumber;
    data['salePassword'] = this.salePassword;
    data['salePortion'] = this.salePortion;
    data['saleValue'] = this.saleValue;
    return data;
  }
}
