class UserModel {
  String? name;
  int? mobileNumber;

  UserModel({this.name, this.mobileNumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    mobileNumber = json['Mobile'];
  }

  Map<String, dynamic> toJson() {
    return {'Name': name, 'Mobile': mobileNumber};
  }
}
