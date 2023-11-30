// To parse this JSON data, do
//
//     final airports = airportsFromJson(jsonString);

import 'dart:convert';

List<Airports> airportsFromJson(String str) =>
    List<Airports>.from(json.decode(str).map((x) => Airports.fromJson(x)));

String airportsToJson(List<Airports> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Airports {
  String icao;
  String iata;
  String name;
  String city;
  String region;
  String country;
  String elevationFt;
  String latitude;
  String longitude;
  String timezone;

  Airports({
    required this.icao,
    required this.iata,
    required this.name,
    required this.city,
    required this.region,
    required this.country,
    required this.elevationFt,
    required this.latitude,
    required this.longitude,
    required this.timezone,
  });

  factory Airports.fromJson(Map<String, dynamic> json) => Airports(
        icao: json["icao"],
        iata: json["iata"],
        name: json["name"],
        city: json["city"],
        region: json["region"],
        country: json["country"],
        elevationFt: json["elevation_ft"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "icao": icao,
        "iata": iata,
        "name": name,
        "city": city,
        "region": region,
        "country": country,
        "elevation_ft": elevationFt,
        "latitude": latitude,
        "longitude": longitude,
        "timezone": timezone,
      };
}
