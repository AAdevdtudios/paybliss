// To parse this JSON data, do
//
//     final airports = airportsFromJson(jsonString);

import 'dart:convert';

Airports airportsFromJson(String str) => Airports.fromJson(json.decode(str));

String airportsToJson(Airports data) => json.encode(data.toJson());

class Airports {
  Meta meta;
  List<Datum> data;

  Airports({
    required this.meta,
    required this.data,
  });

  factory Airports.fromJson(Map<String, dynamic> json) => Airports(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String type;
  String subType;
  String name;
  String detailedName;
  String id;
  Self self;
  String timeZoneOffset;
  String iataCode;
  GeoCode geoCode;
  Address address;

  Datum({
    required this.type,
    required this.subType,
    required this.name,
    required this.detailedName,
    required this.id,
    required this.self,
    required this.timeZoneOffset,
    required this.iataCode,
    required this.geoCode,
    required this.address,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        subType: json["subType"],
        name: json["name"],
        detailedName: json["detailedName"],
        id: json["id"],
        self: Self.fromJson(json["self"]),
        timeZoneOffset: json["timeZoneOffset"],
        iataCode: json["iataCode"],
        geoCode: GeoCode.fromJson(json["geoCode"]),
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "subType": subType,
        "name": name,
        "detailedName": detailedName,
        "id": id,
        "self": self.toJson(),
        "timeZoneOffset": timeZoneOffset,
        "iataCode": iataCode,
        "geoCode": geoCode.toJson(),
        "address": address.toJson(),
      };
}

class Address {
  String cityName;
  String cityCode;
  String countryName;
  String countryCode;
  String regionCode;

  Address({
    required this.cityName,
    required this.cityCode,
    required this.countryName,
    required this.countryCode,
    required this.regionCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        cityName: json["cityName"],
        cityCode: json["cityCode"],
        countryName: json["countryName"],
        countryCode: json["countryCode"],
        regionCode: json["regionCode"],
      );

  Map<String, dynamic> toJson() => {
        "cityName": cityName,
        "cityCode": cityCode,
        "countryName": countryName,
        "countryCode": countryCode,
        "regionCode": regionCode,
      };
}

class GeoCode {
  double latitude;
  double longitude;

  GeoCode({
    required this.latitude,
    required this.longitude,
  });

  factory GeoCode.fromJson(Map<String, dynamic> json) => GeoCode(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Self {
  String href;
  List<String> methods;

  Self({
    required this.href,
    required this.methods,
  });

  factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
        methods: List<String>.from(json["methods"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "methods": List<dynamic>.from(methods.map((x) => x)),
      };
}

class Meta {
  int count;
  Links links;

  Meta({
    required this.count,
    required this.links,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        count: json["count"],
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "links": links.toJson(),
      };
}

class Links {
  String self;

  Links({
    required this.self,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
      };
}
