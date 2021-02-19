class NotificationModel {
  num notificationId;
  String titulo;
  String texto;

  NotificationModel({
    this.notificationId,
    this.titulo,
    this.texto,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    titulo = json['titulo'];
    texto = json['texto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notificationId'] = this.notificationId;
    data['titulo'] = this.titulo;
    data['texto'] = this.texto;
    return data;
  }
}
