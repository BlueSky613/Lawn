class User {
  String firstName;
  String lastName;
  String email;
  String address1;
  String address2;
  String city;
  String state;
  String zip;
  String phone1;
  String phone2;

  User(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.address1,
      required this.address2,
      required this.city,
      required this.state,
      required this.zip,
      required this.phone1,
      required this.phone2});

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "address1": address1,
        "address2": address2,
        "city": city,
        "state": state,
        "zip": zip,
        "phone1": phone1,
        "phone2": phone2
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      address1: json['address1'],
      address2: json['address2'],
      state: json['state'],
      city: json['city'],
      zip: json['zip'],
      phone1: json['phone1'],
      phone2: json['phone2'],
    );
  }
}

class LoginResponse {
  String msg;
  String token;
  bool isFirst;
  User user;

  LoginResponse(
      {required this.msg,
      required this.token,
      required this.isFirst,
      required this.user});

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "token": token,
        "isFirst": isFirst,
        "user": user
  };

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      msg: json['msg'],
      token: json['token'],
      isFirst: json['isFirst'],
      user: User.fromJson(json['user']),
    );
  }
}
