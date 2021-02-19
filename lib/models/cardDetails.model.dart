class CardDetailsModel {
  bool isOwner;
  String holderName;
  String businessName;
  String availableBalance;
  String usedBalance;
  String totalBalance;
  String closeDate;
  String bestPurchaseDate;
  String band;
  String customAssetName;
  String status;

  CardDetailsModel({
    this.isOwner,
    this.holderName,
    this.businessName,
    this.availableBalance,
    this.usedBalance,
    this.totalBalance,
    this.closeDate,
    this.bestPurchaseDate,
    this.band,
    this.customAssetName,
    this.status,
  });

  CardDetailsModel.fromJson(Map<String, dynamic> json) {
    isOwner = json['is_owner'];
    holderName = json['holder_name'];
    businessName = json['business_name'];
    availableBalance = json['available_balance'];
    usedBalance = json['used_balance'];
    totalBalance = json['total_balance'];
    closeDate = json['close_date'];
    bestPurchaseDate = json['best_purchase_date'];
    band = json['band'];
    customAssetName = json['custom_asset_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_owner'] = this.isOwner;
    data['holder_name'] = this.holderName;
    data['business_name'] = this.businessName;
    data['available_balance'] = this.availableBalance;
    data['used_balance'] = this.usedBalance;
    data['total_balance'] = this.totalBalance;
    data['close_date'] = this.closeDate;
    data['best_purchase_date'] = this.bestPurchaseDate;
    data['band'] = this.band;
    data['custom_asset_name'] = this.customAssetName;
    data['status'] = this.status;
    return data;
  }
}
