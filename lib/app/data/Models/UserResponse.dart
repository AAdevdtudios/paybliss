class UserResponse {
  int? statusCode;
  String? message;
  bool? successful;
  User? data;

  UserResponse({this.statusCode, this.message, this.successful, this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    successful = json['successful'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['successful'] = successful;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phoneNumber;
  int? pin;
  String? referralsCode;
  String? verificationToken;
  String? verifiedAt;
  String? createdAt;
  String? passwordReset;
  String? resetTokenExpires;
  String? jwToken;
  String? customerId;
  String? bvn;
  String? tier;
  String? refreshToken;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phoneNumber,
      this.pin,
      this.referralsCode,
      this.verificationToken,
      this.verifiedAt,
      this.createdAt,
      this.passwordReset,
      this.resetTokenExpires,
      this.jwToken,
      this.bvn,
      this.customerId,
      this.tier,
      this.refreshToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    pin = json['pin'];
    referralsCode = json['referralsCode'];
    verificationToken = json['verificationToken'];
    verifiedAt = json['verifiedAt'];
    createdAt = json['createdAt'];
    passwordReset = json['passwordReset'];
    resetTokenExpires = json['resetTokenExpires'];
    bvn = json['bvn'];
    jwToken = json['jwToken'];
    customerId = json['custormerId'];
    tier = json['tier'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['pin'] = pin;
    data['referralsCode'] = referralsCode;
    data['verificationToken'] = verificationToken;
    data['verifiedAt'] = verifiedAt;
    data['createdAt'] = createdAt;
    data['passwordReset'] = passwordReset;
    data['resetTokenExpires'] = resetTokenExpires;
    data['jwToken'] = jwToken;
    data['tier'] = tier;
    data['custormerId'] = customerId;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
