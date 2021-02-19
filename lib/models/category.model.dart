class EstabilishmentCategoryModel {
  int id;
  String name;
  String customAssetName;

  EstabilishmentCategoryModel({this.id, this.name, this.customAssetName});

  EstabilishmentCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    customAssetName = json['custom_asset_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['custom_asset_name'] = this.customAssetName;
    return data;
  }
}
