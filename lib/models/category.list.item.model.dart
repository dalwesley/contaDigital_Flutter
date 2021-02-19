class CategoryListItemModel {
  int id;
  String name;
  String customAssetName;
  int idCity;

  CategoryListItemModel(
      {this.id, this.name, this.customAssetName, this.idCity});

  CategoryListItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    customAssetName = json['custom_asset_name'];
    idCity = json['idCity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['custom_asset_name'] = this.customAssetName;
    data['idCity'] = this.idCity;
    return data;
  }
}
