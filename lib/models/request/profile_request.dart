import 'dart:convert';

class ProfileRequest {
  ProfileRequest(
      {
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.address1,
      required this.address2,
      required this.phone1,
      required this.phone2,
      required this.city,
      required this.state,
      required this.zip,});

  String firstName;
  String lastName;
  String email;
  String address1;
  String phone1;
  String city;
  String state;
  String zip;
  String address2;
  String phone2;

  factory ProfileRequest.fromRawJson(String str) =>
      ProfileRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileRequest.fromJson(Map<String, dynamic> json) =>
      ProfileRequest(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        address2: json["address2"],
        address1: json["address1"],
        phone1: json["phone1"],
        phone2: json["phone2"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
      );

  Map<String, dynamic> toJson() => {
        "firstName":firstName,
        "lastName":lastName,
        "email": email,
        "address2": address2,
        "address1": address1,
        "phone1": phone1,
        "phone2": phone2,
        "city": city,
        "state": state,
        "zip": zip,
      };
}
