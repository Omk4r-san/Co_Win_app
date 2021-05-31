// To parse this JSON data, do
//
//     final stateStatModel = stateStatModelFromJson(jsonString);

import 'dart:convert';

List<StateStatModel> stateStatModelFromJson(String str) =>
    List<StateStatModel>.from(
        json.decode(str).map((x) => StateStatModel.fromJson(x)));

String stateStatModelToJson(List<StateStatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StateStatModel {
  StateStatModel({
    this.state,
    this.statecode,
    this.districtData,
  });

  String state;
  String statecode;
  List<DistrictDatum> districtData;

  factory StateStatModel.fromJson(Map<String, dynamic> json) => StateStatModel(
        state: json["state"],
        statecode: json["statecode"],
        districtData: List<DistrictDatum>.from(
            json["districtData"].map((x) => DistrictDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "statecode": statecode,
        "districtData": List<dynamic>.from(districtData.map((x) => x.toJson())),
      };
}

class DistrictDatum {
  DistrictDatum({
    this.district,
    this.notes,
    this.active,
    this.confirmed,
    this.migratedother,
    this.deceased,
    this.recovered,
    this.delta,
  });

  String district;
  String notes;
  int active;
  int confirmed;
  int migratedother;
  int deceased;
  int recovered;
  Delta delta;

  factory DistrictDatum.fromJson(Map<String, dynamic> json) => DistrictDatum(
        district: json["district"],
        notes: json["notes"],
        active: json["active"],
        confirmed: json["confirmed"],
        migratedother: json["migratedother"],
        deceased: json["deceased"],
        recovered: json["recovered"],
        delta: Delta.fromJson(json["delta"]),
      );

  Map<String, dynamic> toJson() => {
        "district": district,
        "notes": notes,
        "active": active,
        "confirmed": confirmed,
        "migratedother": migratedother,
        "deceased": deceased,
        "recovered": recovered,
        "delta": delta.toJson(),
      };
}

class Delta {
  Delta({
    this.confirmed,
    this.deceased,
    this.recovered,
  });

  int confirmed;
  int deceased;
  int recovered;

  factory Delta.fromJson(Map<String, dynamic> json) => Delta(
        confirmed: json["confirmed"],
        deceased: json["deceased"],
        recovered: json["recovered"],
      );

  Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "deceased": deceased,
        "recovered": recovered,
      };
}
