class ExtractDetailsModel {
  String description;
  String date;
  String value;
  String type;

  ExtractDetailsModel({
    this.description,
    this.value,
    this.date,
    this.type,
  });

  ExtractDetailsModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    value = json['value'];
    date = json['date'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['description'] = this.description;
    data['value'] = this.value;
    data['date'] = this.date;
    data['type'] = this.type;
    return data;
  }
}
