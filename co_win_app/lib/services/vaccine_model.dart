// To parse this JSON data, do
//
//     final vaccineModel = vaccineModelFromJson(jsonString);

import 'dart:convert';

VaccineModel vaccineModelFromJson(String str) =>
    VaccineModel.fromJson(json.decode(str));

String vaccineModelToJson(VaccineModel data) => json.encode(data.toJson());

class VaccineModel {
  VaccineModel({
    this.sessions,
  });

  List<Session> sessions;

  factory VaccineModel.fromJson(Map<String, dynamic> json) => VaccineModel(
        sessions: List<Session>.from(
            json["sessions"].map((x) => Session.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sessions": List<dynamic>.from(sessions.map((x) => x.toJson())),
      };
}

class Session {
  Session({
    this.centerId,
    this.name,
    this.nameL,
    this.address,
    this.addressL,
    this.stateName,
    this.stateNameL,
    this.districtName,
    this.districtNameL,
    this.blockName,
    this.blockNameL,
    this.pincode,
    this.lat,
    this.long,
    this.from,
    this.to,
    this.feeType,
    this.fee,
    this.sessionId,
    this.date,
    this.availableCapacity,
    this.availableCapacityDose1,
    this.availableCapacityDose2,
    this.minAgeLimit,
    this.vaccine,
    this.slots,
  });

  int centerId;
  String name;
  String nameL;
  String address;
  String addressL;
  String stateName;
  String stateNameL;
  String districtName;
  String districtNameL;
  String blockName;
  String blockNameL;
  String pincode;
  double lat;
  double long;
  String from;
  String to;
  String feeType;
  String fee;
  String sessionId;
  String date;
  int availableCapacity;
  int availableCapacityDose1;
  int availableCapacityDose2;
  int minAgeLimit;
  String vaccine;
  List<String> slots;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        centerId: json["center_id"],
        name: json["name"],
        nameL: json["name_l"],
        address: json["address"],
        addressL: json["address_l"],
        stateName: json["state_name"],
        stateNameL: json["state_name_l"],
        districtName: json["district_name"],
        districtNameL: json["district_name_l"],
        blockName: json["block_name"],
        blockNameL: json["block_name_l"],
        pincode: json["pincode"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        from: json["from"],
        to: json["to"],
        feeType: json["fee_type"],
        fee: json["fee"],
        sessionId: json["session_id"],
        date: json["date"],
        availableCapacity: json["available_capacity"],
        availableCapacityDose1: json["available_capacity_dose1"],
        availableCapacityDose2: json["available_capacity_dose2"],
        minAgeLimit: json["min_age_limit"],
        vaccine: json["vaccine"],
        slots: List<String>.from(json["slots"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "center_id": centerId,
        "name": name,
        "name_l": nameL,
        "address": address,
        "address_l": addressL,
        "state_name": stateName,
        "state_name_l": stateNameL,
        "district_name": districtName,
        "district_name_l": districtNameL,
        "block_name": blockName,
        "block_name_l": blockNameL,
        "pincode": pincode,
        "lat": lat,
        "long": long,
        "from": from,
        "to": to,
        "fee_type": feeType,
        "fee": fee,
        "session_id": sessionId,
        "date": date,
        "available_capacity": availableCapacity,
        "available_capacity_dose1": availableCapacityDose1,
        "available_capacity_dose2": availableCapacityDose2,
        "min_age_limit": minAgeLimit,
        "vaccine": vaccine,
        "slots": List<dynamic>.from(slots.map((x) => x)),
      };
}
