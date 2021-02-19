class CardStatusModel {
  String cardStatus;
  String cardDefaultPassword;
  String cardRequestsData;
  String termoLGPD;

  CardStatusModel({
    this.cardStatus,
    this.cardDefaultPassword,
    this.cardRequestsData,
    this.termoLGPD,
  });

  CardStatusModel.fromJson(Map<String, dynamic> json) {
    cardStatus = json['status'];
    cardDefaultPassword = json['senhaPadrao'];
    cardRequestsData = json['solicitaDados'];
    termoLGPD = json['termoLGPD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.cardStatus;
    data['senhaPadrao'] = this.cardDefaultPassword;
    data['solicitaDados'] = this.cardRequestsData;
    data['termoLGPD'] = this.termoLGPD;
    return data;
  }
}
