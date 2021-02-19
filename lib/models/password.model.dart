class PasswordModel {
  String idReturn;
  String userNewPassword;
  String userOldPassword;
  String userCvv;
  String userCardNunber;
  String userCpf;

  PasswordModel({
    this.idReturn,
    this.userNewPassword,
    this.userOldPassword,
    this.userCvv,
    this.userCardNunber,
    this.userCpf,
  });

  PasswordModel.fromJson(Map<String, dynamic> json) {
    idReturn = json['id_return'];
    userNewPassword = json['userNewPassword'];
    userOldPassword = json['userOldPassword'];
    userCvv = json['userCvv'];
    userCardNunber = json['userCardNunber'];
    userCpf = json['userCpf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_return'] = this.idReturn;
    data['userNewPassword'] = this.userNewPassword;
    data['userOldPassword'] = this.userOldPassword;
    data['userCvv'] = this.userCvv;
    data['userCardNunber'] = this.userCardNunber;
    data['userCpf'] = this.userCpf;

    return data;
  }
}

// String userNewPassword;
// String userOldPassword;
// String userCvv;
// String userCardNunber;
