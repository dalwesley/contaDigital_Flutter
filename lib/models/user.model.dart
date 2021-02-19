class UserModel {
  String userCardNunber;
  String userCpf;
  String userName;
  String userEmail;
  String userSexo;
  String userPhone;
  String userBirthDate;
  String userAddress;
  String userNumber;
  String userComplement;
  String userDistrict;
  String userCep;
  String userCity;
  String userState;

  UserModel({
    this.userCardNunber,
    this.userCpf,
    this.userName,
    this.userEmail,
    this.userSexo,
    this.userPhone,
    this.userBirthDate,
    this.userAddress,
    this.userNumber,
    this.userComplement,
    this.userDistrict,
    this.userCep,
    this.userCity,
    this.userState,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userCardNunber = json['userCardNunber'];
    userCpf = json['userCpf'];
    userName = json['userName'];
    userEmail = json['userEmail'];
    userSexo = json['userSexo'];
    userPhone = json['userPhone'];
    userBirthDate = json['userBirthDate'];
    userAddress = json['userAddress'];
    userNumber = json['userNumber'];
    userComplement = json['userComplement'];
    userDistrict = json['userDistrict'];
    userCep = json['userCep'];
    userCity = json['userCity'];
    userState = json['userState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userCardNunber'] = this.userCardNunber;
    data['userCpf'] = this.userCpf;
    data['userName'] = this.userName;
    data['userEmail'] = this.userEmail;
    data['userSexo'] = this.userSexo;
    data['userPhone'] = this.userPhone;
    data['userBirthDate'] = this.userBirthDate;
    data['userAddress'] = this.userAddress;
    data['userNumber'] = this.userNumber;
    data['userComplement'] = this.userComplement;
    data['userDistrict'] = this.userDistrict;
    data['userCep'] = this.userCep;
    data['userCity'] = this.userCity;
    data['userState'] = this.userState;
    return data;
  }
}
