class ResponseModel {
  String id_return;
  String message;

  ResponseModel({
    this.id_return,
    this.message,
  });

  ResponseModel.fromJson(Map<String, dynamic> json) {
    id_return = json['id_return'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_return'] = this.id_return;
    data['message'] = this.message;
    return data;
  }
}
