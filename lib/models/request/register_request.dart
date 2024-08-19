import 'dart:convert';

class RegisterRequest {
  RegisterRequest(
      {
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.address1,
      required this.phone1,
      required this.city,
      required this.state,
      required this.zip,
      required this.securityQuestion,
      required this.securityAnswer});

  String firstName;
  String lastName;
  String email;
  String password;
  String address1;
  String phone1;
  String city;
  String state;
  String zip;
  String securityQuestion;
  String securityAnswer;

  factory RegisterRequest.fromRawJson(String str) =>
      RegisterRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        address1: json["address1"],
        phone1: json["phone1"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        securityQuestion: json["securityQuestion"],
        securityAnswer: json["securityAnswer"],
      );

  Map<String, dynamic> toJson() => {
        "firstName":firstName,
        "lastName":lastName,
        "email": email,
        "password": password,
        "address1": address1,
        "phone1": phone1,
        "city": city,
        "state": state,
        "zip": zip,
        "securityQuestion": securityQuestion,
        "securityAnswer": securityAnswer
      };
}
