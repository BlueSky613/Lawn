import 'dart:convert';

class RegisterResponse {
  RegisterResponse(
      {required this.msg,
      required this.newUserAccountWithoutPassword,
      required this.newUser,});

  String msg;
  String newUserAccountWithoutPassword;
  String newUser;

  factory RegisterResponse.fromRawJson(String str) =>
      RegisterResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        msg: json['msg'],
        newUserAccountWithoutPassword:json['newUserAccountWithoutPassword'],
        newUser:json['newUser']
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "newUserAccountWithoutPassword":newUserAccountWithoutPassword,
        "newUser":newUser 
      };
}
