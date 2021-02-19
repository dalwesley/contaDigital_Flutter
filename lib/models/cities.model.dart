class CitiesModel {
  int idCity;
  String name;

  CitiesModel({this.idCity, this.name});

  CitiesModel.fromJson(Map<String, dynamic> json) {
    idCity = json['idCity'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCity'] = this.idCity;
    data['name'] = this.name;
    return data;
  }
}
