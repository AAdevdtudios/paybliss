// To parse this JSON data, do
//
//     final flightData = flightDataFromJson(jsonString);

import 'dart:convert';

FlightData flightDataFromJson(String str) =>
    FlightData.fromJson(json.decode(str));

String flightDataToJson(FlightData data) => json.encode(data.toJson());

class FlightData {
  String type;
  String id;
  String source;
  bool instantTicketingRequired;
  bool nonHomogeneous;
  bool oneWay;
  DateTime lastTicketingDate;
  DateTime lastTicketingDateTime;
  int numberOfBookableSeats;
  List<Itinerary> itineraries;
  FlightDataPrice price;
  PricingOptions pricingOptions;
  List<String> validatingAirlineCodes;
  List<TravelerPricing> travelerPricings;

  FlightData({
    required this.type,
    required this.id,
    required this.source,
    required this.instantTicketingRequired,
    required this.nonHomogeneous,
    required this.oneWay,
    required this.lastTicketingDate,
    required this.lastTicketingDateTime,
    required this.numberOfBookableSeats,
    required this.itineraries,
    required this.price,
    required this.pricingOptions,
    required this.validatingAirlineCodes,
    required this.travelerPricings,
  });

  factory FlightData.fromJson(Map<String, dynamic> json) => FlightData(
        type: json["type"],
        id: json["id"],
        source: json["source"],
        instantTicketingRequired: json["instantTicketingRequired"],
        nonHomogeneous: json["nonHomogeneous"],
        oneWay: json["oneWay"],
        lastTicketingDate: DateTime.parse(json["lastTicketingDate"]),
        lastTicketingDateTime: DateTime.parse(json["lastTicketingDateTime"]),
        numberOfBookableSeats: json["numberOfBookableSeats"],
        itineraries: List<Itinerary>.from(
            json["itineraries"].map((x) => Itinerary.fromJson(x))),
        price: FlightDataPrice.fromJson(json["price"]),
        pricingOptions: PricingOptions.fromJson(json["pricingOptions"]),
        validatingAirlineCodes:
            List<String>.from(json["validatingAirlineCodes"].map((x) => x)),
        travelerPricings: List<TravelerPricing>.from(
            json["travelerPricings"].map((x) => TravelerPricing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "source": source,
        "instantTicketingRequired": instantTicketingRequired,
        "nonHomogeneous": nonHomogeneous,
        "oneWay": oneWay,
        "lastTicketingDate":
            "${lastTicketingDate.year.toString().padLeft(4, '0')}-${lastTicketingDate.month.toString().padLeft(2, '0')}-${lastTicketingDate.day.toString().padLeft(2, '0')}",
        "lastTicketingDateTime":
            "${lastTicketingDateTime.year.toString().padLeft(4, '0')}-${lastTicketingDateTime.month.toString().padLeft(2, '0')}-${lastTicketingDateTime.day.toString().padLeft(2, '0')}",
        "numberOfBookableSeats": numberOfBookableSeats,
        "itineraries": List<dynamic>.from(itineraries.map((x) => x.toJson())),
        "price": price.toJson(),
        "pricingOptions": pricingOptions.toJson(),
        "validatingAirlineCodes":
            List<dynamic>.from(validatingAirlineCodes.map((x) => x)),
        "travelerPricings":
            List<dynamic>.from(travelerPricings.map((x) => x.toJson())),
      };
}

class Itinerary {
  String duration;
  List<Segment> segments;

  Itinerary({
    required this.duration,
    required this.segments,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        duration: json["duration"],
        segments: List<Segment>.from(
            json["segments"].map((x) => Segment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "segments": List<dynamic>.from(segments.map((x) => x.toJson())),
      };
}

class Segment {
  Arrival departure;
  Arrival arrival;
  String carrierCode;
  String number;
  Aircraft aircraft;
  Operating operating;
  String duration;
  String id;
  int numberOfStops;
  bool blacklistedInEu;

  Segment({
    required this.departure,
    required this.arrival,
    required this.carrierCode,
    required this.number,
    required this.aircraft,
    required this.operating,
    required this.duration,
    required this.id,
    required this.numberOfStops,
    required this.blacklistedInEu,
  });

  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
        departure: Arrival.fromJson(json["departure"]),
        arrival: Arrival.fromJson(json["arrival"]),
        carrierCode: json["carrierCode"],
        number: json["number"],
        aircraft: Aircraft.fromJson(json["aircraft"]),
        operating: Operating.fromJson(json["operating"]),
        duration: json["duration"],
        id: json["id"],
        numberOfStops: json["numberOfStops"],
        blacklistedInEu: json["blacklistedInEU"],
      );

  Map<String, dynamic> toJson() => {
        "departure": departure.toJson(),
        "arrival": arrival.toJson(),
        "carrierCode": carrierCode,
        "number": number,
        "aircraft": aircraft.toJson(),
        "operating": operating.toJson(),
        "duration": duration,
        "id": id,
        "numberOfStops": numberOfStops,
        "blacklistedInEU": blacklistedInEu,
      };
}

class Aircraft {
  String code;

  Aircraft({
    required this.code,
  });

  factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}

class Arrival {
  String iataCode;
  String? terminal;
  DateTime at;

  Arrival({
    required this.iataCode,
    this.terminal,
    required this.at,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        iataCode: json["iataCode"],
        terminal: json["terminal"],
        at: DateTime.parse(json["at"]),
      );

  Map<String, dynamic> toJson() => {
        "iataCode": iataCode,
        "terminal": terminal,
        "at": at.toIso8601String(),
      };
}

class Operating {
  String carrierCode;

  Operating({
    required this.carrierCode,
  });

  factory Operating.fromJson(Map<String, dynamic> json) => Operating(
        carrierCode: json["carrierCode"],
      );

  Map<String, dynamic> toJson() => {
        "carrierCode": carrierCode,
      };
}

class FlightDataPrice {
  String currency;
  String total;
  String base;
  List<Fee> fees;
  String grandTotal;

  FlightDataPrice({
    required this.currency,
    required this.total,
    required this.base,
    required this.fees,
    required this.grandTotal,
  });

  factory FlightDataPrice.fromJson(Map<String, dynamic> json) =>
      FlightDataPrice(
        currency: json["currency"],
        total: json["total"],
        base: json["base"],
        fees: List<Fee>.from(json["fees"].map((x) => Fee.fromJson(x))),
        grandTotal: json["grandTotal"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "total": total,
        "base": base,
        "fees": List<dynamic>.from(fees.map((x) => x.toJson())),
        "grandTotal": grandTotal,
      };
}

class Fee {
  String amount;
  String type;

  Fee({
    required this.amount,
    required this.type,
  });

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        amount: json["amount"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "type": type,
      };
}

class PricingOptions {
  List<String> fareType;
  bool includedCheckedBagsOnly;

  PricingOptions({
    required this.fareType,
    required this.includedCheckedBagsOnly,
  });

  factory PricingOptions.fromJson(Map<String, dynamic> json) => PricingOptions(
        fareType: List<String>.from(json["fareType"].map((x) => x)),
        includedCheckedBagsOnly: json["includedCheckedBagsOnly"],
      );

  Map<String, dynamic> toJson() => {
        "fareType": List<dynamic>.from(fareType.map((x) => x)),
        "includedCheckedBagsOnly": includedCheckedBagsOnly,
      };
}

class TravelerPricing {
  String travelerId;
  String fareOption;
  String travelerType;
  TravelerPricingPrice price;
  List<FareDetailsBySegment> fareDetailsBySegment;

  TravelerPricing({
    required this.travelerId,
    required this.fareOption,
    required this.travelerType,
    required this.price,
    required this.fareDetailsBySegment,
  });

  factory TravelerPricing.fromJson(Map<String, dynamic> json) =>
      TravelerPricing(
        travelerId: json["travelerId"],
        fareOption: json["fareOption"],
        travelerType: json["travelerType"],
        price: TravelerPricingPrice.fromJson(json["price"]),
        fareDetailsBySegment: List<FareDetailsBySegment>.from(
            json["fareDetailsBySegment"]
                .map((x) => FareDetailsBySegment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "travelerId": travelerId,
        "fareOption": fareOption,
        "travelerType": travelerType,
        "price": price.toJson(),
        "fareDetailsBySegment":
            List<dynamic>.from(fareDetailsBySegment.map((x) => x.toJson())),
      };
}

class FareDetailsBySegment {
  String segmentId;
  String cabin;
  String fareBasis;
  String fareDetailsBySegmentClass;
  IncludedCheckedBags includedCheckedBags;

  FareDetailsBySegment({
    required this.segmentId,
    required this.cabin,
    required this.fareBasis,
    required this.fareDetailsBySegmentClass,
    required this.includedCheckedBags,
  });

  factory FareDetailsBySegment.fromJson(Map<String, dynamic> json) =>
      FareDetailsBySegment(
        segmentId: json["segmentId"],
        cabin: json["cabin"],
        fareBasis: json["fareBasis"],
        fareDetailsBySegmentClass: json["class"],
        includedCheckedBags:
            IncludedCheckedBags.fromJson(json["includedCheckedBags"]),
      );

  Map<String, dynamic> toJson() => {
        "segmentId": segmentId,
        "cabin": cabin,
        "fareBasis": fareBasis,
        "class": fareDetailsBySegmentClass,
        "includedCheckedBags": includedCheckedBags.toJson(),
      };
}

class IncludedCheckedBags {
  int quantity;

  IncludedCheckedBags({
    required this.quantity,
  });

  factory IncludedCheckedBags.fromJson(Map<String, dynamic> json) =>
      IncludedCheckedBags(
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
      };
}

class TravelerPricingPrice {
  String currency;
  String total;
  String base;

  TravelerPricingPrice({
    required this.currency,
    required this.total,
    required this.base,
  });

  factory TravelerPricingPrice.fromJson(Map<String, dynamic> json) =>
      TravelerPricingPrice(
        currency: json["currency"],
        total: json["total"],
        base: json["base"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "total": total,
        "base": base,
      };
}
