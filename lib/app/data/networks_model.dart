class Networks {
  Airtel? airtel;
  Airtel? mTN;

  Networks({this.airtel, this.mTN});

  Networks.fromJson(Map<String, dynamic> json) {
    airtel = json['Airtel'] != null ? Airtel?.fromJson(json['Airtel']) : null;
    mTN = json['MTN'] != null ? Airtel?.fromJson(json['MTN']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (airtel != null) {
      data['Airtel'] = airtel?.toJson();
    }
    if (mTN != null) {
      data['MTN'] = mTN?.toJson();
    }
    return data;
  }
}

class Airtel {
  List<Daily>? daily;
  List<Daily>? weekly;
  List<Daily>? monthly;

  Airtel({this.daily, this.weekly, this.monthly});

  Airtel.fromJson(Map<String, dynamic> json) {
    if (json['Daily'] != null) {
      daily = <Daily>[];
      json['Daily'].forEach((v) {
        daily?.add(Daily.fromJson(v));
      });
    }
    if (json['Weekly'] != null) {
      weekly = <Daily>[];
      json['Weekly'].forEach((v) {
        weekly?.add(Daily.fromJson(v));
      });
    }
    if (json['Monthly'] != null) {
      monthly = <Daily>[];
      json['Monthly'].forEach((v) {
        monthly?.add(Daily.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (daily != null) {
      data['Daily'] = daily?.map((v) => v.toJson()).toList();
    }
    if (weekly != null) {
      data['Weekly'] = weekly?.map((v) => v.toJson()).toList();
    }
    if (monthly != null) {
      data['Monthly'] = monthly?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Daily {
  String? title;
  String? subtitle;
  int? value;

  Daily({this.title, this.subtitle, this.value});

  Daily.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['value'] = value;
    return data;
  }
}
