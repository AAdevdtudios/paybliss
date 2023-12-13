class AccountDetails {
  int? statusCode;
  String? message;
  bool? successful;
  Data? data;

  AccountDetails({this.statusCode, this.message, this.successful, this.data});

  AccountDetails.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    successful = json['successful'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  int? id;
  String? accountNumber;
  String? amount;
  String? accountName;
  String? currency;
  String? reference;
  String? bankName;
  String? bank;
  int? userId;

  Data(
      {this.id,
      this.accountNumber,
      this.amount,
      this.accountName,
      this.currency,
      this.reference,
      this.bankName,
      this.bank,
      this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountNumber = json['accountNumber'];
    amount = json['amount'];
    accountName = json['accountName'];
    currency = json['currency'];
    reference = json['reference'];
    bankName = json['bank_name'];
    bank = json['bank'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['accountNumber'] = accountNumber;
    data['amount'] = amount;
    data['accountName'] = accountName;
    data['currency'] = currency;
    data['reference'] = reference;
    data['bank_name'] = bankName;
    data['bank'] = bank;
    data['userId'] = userId;
    return data;
  }
}
