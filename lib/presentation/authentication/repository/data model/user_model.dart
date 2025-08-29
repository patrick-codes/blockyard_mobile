import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

final mockJson = {
  "account": {
    "phone": 'phone',
    "name": "",
    "username": null,
    "bio": null,
    "profile": null,
  },
  "authToken": "",
};

class UserModel {
  String name;
  String phone;
  String? email;
  String? password;

  UserModel({
    required this.name,
    required this.phone,
    this.email,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"] ?? '',
        phone: json["phone"] ?? '',
        email: json["email"] ?? '',
        password: json["password"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
      };
}
