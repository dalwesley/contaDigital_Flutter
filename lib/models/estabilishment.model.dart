class EstabilishmentModel {
  String businessName;
  String publicPlace;
  String number;
  String complement;
  String neighborhood;
  String city;
  String state;
  String postalCode;
  String phoneNumber;
  // EstabilishmentCategoryModel category;

  EstabilishmentModel({
    this.businessName,
    this.publicPlace,
    this.number,
    this.complement,
    this.neighborhood,
    this.city,
    this.state,
    this.postalCode,
    this.phoneNumber,
    // this.category,
  });

  EstabilishmentModel.fromJson(Map<String, dynamic> json) {
    businessName = json['business_name'];
    publicPlace = json['public_place'];
    number = json['number'];
    complement = json['complement'];
    neighborhood = json['neighborhood'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
    phoneNumber = json['phone_number'];
    // category = json['category'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_name'] = this.businessName;
    data['public_place'] = this.publicPlace;
    data['number'] = this.number;
    data['complement'] = this.complement;
    data['neighborhood'] = this.neighborhood;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postal_code'] = this.postalCode;
    data['phone_number'] = this.phoneNumber;
    // data['category'] = this.category;
    return data;
  }
}

// class EstabilishmentCategoryModel {}

// String business_name;
// String public_place;
// String number;
// String complement;
// String neighborhood;
// String city;
// String state;
// String postal_code;
// String phone_number;
